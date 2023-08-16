import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_cubit.dart';

@RoutePage()
class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify email')),
      body: Column(
        children: [
          const Text(
              "We've sent you an email verification. Please open it to verify your account."),
          const Text(
              "If you haven't received a verification email yet, press the button below"),
          TextButton(
            onPressed: () async {
              context.read<AuthCubit>().sendEmailVerification;
            },
            child: const Text(
              'Send email verification',
            ),
          ),
          TextButton(
              onPressed: () async {
                context.read<AuthCubit>().logOut();
              },
              child: const Text('Restart'))
        ],
      ),
    );
  }
}
