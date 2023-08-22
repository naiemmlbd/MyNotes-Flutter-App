import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_router.gr.dart';
import '../helpers/loading/loading_screen.dart';
import '../services/auth/cubit/auth_cubit.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        debugPrint('State: $state');
        state.status.maybeWhen(
          orElse: () => LoadingScreen().hide(),
          loading: () {
            LoadingScreen()
                .show(context: context, text: 'Please wait a moment');
          },
        );

        state.authStatus.when(
            unInitialized: () {},
            loggedIn: () {
              context.replaceRoute(const NotesRoute());
            },
            verification: () {
              context.pushRoute(const VerifyEmailRoute());
            },
            loggedOut: () {
              context.router.replaceAll([const LoginRoute()]);
            },
            registering: () {
              context.pushRoute(const RegisterRoute());
            });
      },
      child: const AutoRouter(),
    );
  }
}
