import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_cubit.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/notes/notes_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';
import 'constants/app_router.dart';
import 'helpers/loading/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  MyApplication({
    super.key,
  });

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(FirebaseAuthProvider())..initialize(),
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        debugPrint('State1: ${state.status}');
        switch (state.status) {
          case AuthStatus.loading:
            LoadingScreen().show(
                context: context,
                text: state.loadingText ?? 'Please wait a moment');
            break;
          case AuthStatus.notLoading:
            LoadingScreen().hide();
            break;
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            debugPrint('State: $state');
            if (state is AuthStateLoggedIn) {
              return const NotesView();
            } else if (state is AuthStateNeedsVerification) {
              return const VerifyEmailView();
            } else if (state is AuthStateLoggedOut) {
              return const LoginView();
            } else if (state is AuthStateRegistering) {
              return const RegisterView();
            }
            return const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
