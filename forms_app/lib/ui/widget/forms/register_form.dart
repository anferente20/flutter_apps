import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/blocs/cubit/register/register_cubit.dart';
import 'package:forms_app/ui/widget/inputs/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterFormCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            icon: Icons.person_outline,
            onChange: (value) => registerCubit.usernameChanged(value),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo requerido';
              if (value.trim().length < 6) return 'Usuario debe tener más de 6 caractéres';
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo electrónico',
            icon: Icons.email_outlined,
            onChange: (value) => registerCubit.emailChanged(value),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo requerido';
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Ingresa un correo electrónico válido';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            icon: Icons.password_outlined,
            isObscure: true,
            onChange: (value) => registerCubit.passwordChanged(value),
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo requerido';
              if (value.trim().length < 8) return 'Contraseña debe tener más de 8 caractéres';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              _formKey.currentState!.validate();
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
