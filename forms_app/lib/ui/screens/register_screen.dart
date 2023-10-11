import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/blocs/cubit/register/register_cubit.dart';
import 'package:forms_app/ui/widget/forms/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo usuario'),
        ),
        body: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          FlutterLogo(
            size: 200,
          ),
          RegisterForm(),
        ]),
      ),
    ));
  }
}
