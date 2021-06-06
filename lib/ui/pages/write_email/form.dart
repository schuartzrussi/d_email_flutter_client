import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/email/write/bloc.dart';
import 'package:d_email_flutter_client/bloc/email/write/event.dart';
import 'package:d_email_flutter_client/bloc/email/write/state.dart';
import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:d_email_flutter_client/ui/components/d_email_progress_dialog/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_snackbar/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_text_form_field/component.dart';
import 'package:d_email_flutter_client/ui/form_validator/required_field.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'arguments.dart';

class WriteEmailForm extends StatefulWidget {
  final WriteEmailArguments? arguments;

  const WriteEmailForm({Key? key, this.arguments}) : super(key: key);

  @override
  _WriteEmailFormState createState() => _WriteEmailFormState();
}

class _WriteEmailFormState extends State<WriteEmailForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  TextEditingController _toController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  DEmailProgressDialog? _progressDialog;

  @override
  Widget build(BuildContext context) {
    this._progressDialog = DEmailProgressDialog(context);

    bool subjectEnabled = true;
    if (widget.arguments != null && widget.arguments!.to != null) {
      _toController.text = widget.arguments!.to!.join(";");
      subjectEnabled = false;
      _subjectController.text = widget.arguments!.responseTo!.subject;
    }

    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: BlocListener<WriteEmailBloc, WriteEmailState>(
          listener: (context, state) {
            if (state.loading) {
              this._progressDialog?.show("Enviando...");
            } else {
              this._progressDialog?.hide();

              if (state.error != null) {
                DEmailSnackBar.show(context, state.error!, 3);
              } else if (state.success) {
                Navigator.of(context).pop();
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 500, maxHeight: 700),
                child: Form(
                    key: _key,
                    autovalidateMode: this._autovalidateMode,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        DEmailTextFormField(
                            label: "Destinatario",
                            textInputType: TextInputType.text,
                            obscureText: false,
                            textEditingController: _toController,
                            validator: (val) => RequiredFieldFormValidator
                                .validateRequiredField(val, "Destinatario")),
                        SizedBox(height: 20.0),
                        DEmailTextFormField(
                            label: "Assunto",
                            textInputType: TextInputType.text,
                            enabled: subjectEnabled,
                            obscureText: false,
                            textEditingController: _subjectController,
                            validator: (val) => RequiredFieldFormValidator
                                .validateRequiredField(val, "Assunto")),
                        SizedBox(height: 20.0),
                        DEmailTextFormField(
                            label: "Corpo",
                            textInputAction: TextInputAction.newline,
                            maxLines: 10,
                            textInputType: TextInputType.multiline,
                            obscureText: false,
                            textEditingController: _bodyController,
                            validator: (val) => RequiredFieldFormValidator
                                .validateRequiredField(val, "Corpo")),
                        SizedBox(height: 20.0),
                        _getSubmitButton(context),
                      ],
                    ))),
              ),
            ],
          ),
        ));
  }

  ElevatedButton _getSubmitButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Enviar'),
      onPressed: () {
        var formState = _key.currentState;
        if (formState != null && formState.validate()) {
          Email? responseTo;
          if (widget.arguments != null) {
            responseTo = widget.arguments!.responseTo;
          }

          BlocProvider.of<WriteEmailBloc>(context).add(SendEmailEvent(
              user: (BlocProvider.of<AuthBloc>(context).state
                      as AuthenticatedUserState)
                  .user,
              responseTo: responseTo,
              subject: this._subjectController.text,
              body: this._bodyController.text,
              to: this._toController.text.split(";")));
        } else {
          setState(() {
            this._autovalidateMode = AutovalidateMode.always;
          });
        }
      },
    );
  }
}
