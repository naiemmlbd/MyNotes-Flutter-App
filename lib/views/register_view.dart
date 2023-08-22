import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import '../services/auth/cubit/auth_cubit.dart';
import '../utilities/dialogs/error_dialog.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _showErrorDialog(String errorMessage) async {
    await showErrorDialog(context, errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state.authStatus.isRegistering) {
          state.status.maybeWhen(
            orElse: () => '',
            failed: (Exception exception) {
              if (exception is WeakPasswordAuthException) {
                _showErrorDialog('Weak password');
              } else if (exception is EmailAlreadyUseAuthException) {
                _showErrorDialog('Email is already in use');
              } else if (exception is GenericAuthException) {
                _showErrorDialog('Failed to register');
              }
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Regiser')),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: 'Enter your email here'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your pasword here'),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                cubit.register(email, password);
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: cubit.logOut,
              child: const Text('Already registered? Login here!'),
            )
          ],
        ),
      ),
    );
  }
}
