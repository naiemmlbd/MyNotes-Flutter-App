import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import '../services/auth/cubit/auth_cubit.dart';
import '../utilities/dialogs/error_dialog.dart';
import 'custom_text_field.dart';

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
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 64),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.center,
                  colors: [
                    Colors.deepPurpleAccent,
                    Colors.black,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _email,
                        hintText: 'Enter your email here',
                        inputType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _password,
                        hintText: 'Enter your pasword here',
                        inputType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
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
              ),
            ),
            SizedBox(
              height: kToolbarHeight + 44,
              child: AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
                elevation: 0,
                title: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
