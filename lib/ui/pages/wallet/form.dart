import 'package:d_email_flutter_client/bloc/auth/bloc.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/bloc/wallet/bloc.dart';
import 'package:d_email_flutter_client/bloc/wallet/event.dart';
import 'package:d_email_flutter_client/bloc/wallet/state.dart';
import 'package:d_email_flutter_client/ui/components/d_email_text_form_field/component.dart';
import 'package:d_email_flutter_client/ui/form_validator/amount_validator.dart';
import 'package:d_email_flutter_client/ui/form_validator/required_field.dart';
import 'package:d_email_flutter_client/ui/form_validator/wallet_address_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendCoinForm extends StatefulWidget {
  final int totalBalance;

  const SendCoinForm({Key? key, required this.totalBalance}) : super(key: key);

  @override
  _SendCoinFormState createState() => _SendCoinFormState();
}

class _SendCoinFormState extends State<SendCoinForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  TextEditingController _toController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state.sendSuccess) {
          this._toController.clear();
          this._amountController.clear();
        }
      },
      child: Form(
        key: _key,
        autovalidateMode: this._autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            DEmailTextFormField(
                label: "Endereço da carteira",
                textInputType: TextInputType.text,
                obscureText: false,
                textEditingController: this._toController,
                validator: (val) => WalletAddressFormValidator.validate(val)),
            SizedBox(height: 5.0),
            DEmailTextFormField(
                label: "Valor",
                textInputType: TextInputType.number,
                obscureText: false,
                textEditingController: this._amountController,
                validator: (val) => AmountFormValidator.validateAmountField(
                    val, "Valor", widget.totalBalance)),
            SizedBox(height: 5.0),
            ElevatedButton(
              child: Text('Enviar'),
              onPressed: () {
                var formState = _key.currentState;
                if (formState != null && formState.validate()) {
                  BlocProvider.of<WalletBloc>(context).add(SendEvent(
                      (BlocProvider.of<AuthBloc>(context).state
                              as AuthenticatedUserState)
                          .user,
                      this._toController.text,
                      int.parse(this._amountController.text)));
                } else {
                  setState(() {
                    this._autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
