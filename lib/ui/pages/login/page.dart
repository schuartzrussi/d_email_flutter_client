import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/event.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/ui/components/d_email_snackbar/component.dart';
import 'package:d_email_flutter_client/ui/components/d_email_text_form_field/component.dart';
import 'package:d_email_flutter_client/ui/form_validator/email.dart';
import 'package:d_email_flutter_client/ui/form_validator/required_field.dart';
import 'package:d_email_flutter_client/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            DEmailSnackBar.show(context, state.message, 3);
          }
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _key,
                  autovalidateMode: this._autovalidateMode,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/images/logo-furb.gif",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        DEmailTextFormField(
                            label: "Email",
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            textEditingController: this._emailController,
                            validator: (val) =>
                                EmailFormValidator.validateEmail(val)),
                        SizedBox(height: 25.0),
                        DEmailTextFormField(
                            label: "Senha",
                            textInputType: TextInputType.text,
                            obscureText: true,
                            textEditingController: this._passwordController,
                            validator: (val) => RequiredFieldFormValidator
                                .validateRequiredField(val, "Senha")),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  child: Text("Criar conta"),
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRouter.SIGNUP_PAGE_ROUTE,
                                        (Route<dynamic> route) => false);
                                  }),
                              _getSubmitButton(context),
                            ]),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _getSubmitButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Entrar'),
      onPressed: () {
        var formState = _key.currentState;
        if (formState != null && formState.validate()) {
          BlocProvider.of<AuthBloc>(context).add(LoginEvent(
              this._emailController.text, this._passwordController.text));
        } else {
          setState(() {
            this._autovalidateMode = AutovalidateMode.always;
          });
        }
      },
    );
  }
}
