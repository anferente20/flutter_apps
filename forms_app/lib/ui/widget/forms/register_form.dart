import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/blocs/cubit/register/register_cubit.dart';
import 'package:forms_app/ui/widget/inputs/custom_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterFormCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
              label: 'Nombre de usuario',
              icon: Icons.person_outline,
              onChange: (value) => registerCubit.usernameChanged(value),
              errorMessage: username.errorMessage),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo electrónico',
            icon: Icons.email_outlined,
            onChange: (value) => registerCubit.emailChanged(value),
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            icon: Icons.password_outlined,
            isObscure: true,
            onChange: (value) => registerCubit.passwordChanged(value),
            errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save_outlined),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
