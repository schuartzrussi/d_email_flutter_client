import 'package:d_email_flutter_client/bloc/signup/bloc.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:d_email_flutter_client/ui/pages/signup/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            SignupBloc(RepositoryProvider.of<UserRepository>(context)),
        child:
            Scaffold(backgroundColor: Colors.white10, body: SignupPageForm()));
  }
}
