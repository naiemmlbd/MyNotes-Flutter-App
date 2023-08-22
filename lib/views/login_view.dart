import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import '../constants/app_router.gr.dart';
import '../services/auth/cubit/auth_cubit.dart';
import '../utilities/dialogs/error_dialog.dart';
import 'custom_text_field.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String errorMessage) async {
    await showErrorDialog(context, errorMessage);
  }

  void _login(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;
    context.read<AuthCubit>().logIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state.authStatus.isLoggedOut) {
          state.status.maybeWhen(
            orElse: () => '',
            failed: (Exception exception) {
              if (exception is UserNotFoundAuthException) {
                _showErrorDialog('User not found');
              } else if (exception is WrongPasswordAuthException) {
                _showErrorDialog('Wrong credentials');
              } else if (exception is GenericAuthException) {
                _showErrorDialog('Authentication Error');
              }
            },
          );
        }
      },
      child: Scaffold(
        body: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email here',
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
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login(context);
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(const Size(150.0, 40.0)),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20, color: Colors.deepPurpleAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.push(const RegisterRoute());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not registered yet?',
                            style: TextStyle(color: Colors.white)),
                        Text(
                          ' Register here!',
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
