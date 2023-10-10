part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  const RegisterFormState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });

  final String username;
  final String email;
  final String password;
  final FormStatus formStatus;

  RegisterFormState copyWith(
          {FormStatus? formStatus, String? username, String? email, String? password}) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, username, email, password];
}
