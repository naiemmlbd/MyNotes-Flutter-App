import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_cubit.dart';
import '../constants/app_router.gr.dart';
import '../helpers/loading/loading_screen.dart';
import '../services/auth/bloc/auth_state.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        

        debugPrint('State: $state');
        if (state is AuthStateLoggedIn) {
          context.replaceRoute(const NotesRoute());
        } else if (state is AuthStateNeedsVerification) {
          context.pushRoute(const VerifyEmailRoute());
        } else if (state is AuthStateLoggedOut) {
          context.router.replaceAll([const LoginRoute()]);
        } else if (state is AuthStateRegistering) {
          context.pushRoute(const RegisterRoute());
        }
      },
      child: const AutoRouter(),
    );
  }
}
