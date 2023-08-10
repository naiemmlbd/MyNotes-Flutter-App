import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authProvider)
      : super(const AuthStateUninitialized(status: AuthStatus.loading));

  final FirebaseAuthProvider authProvider;

  void sendEmailVerification() async {
    await authProvider.sendEmailVerification();
    emit(state);
  }

  void shouldRegister() {
    emit(const AuthStateRegistering(
      exception: null,
      status: AuthStatus.notLoading,
    ));
  }

  void initialize() async {
    await authProvider.initialize();
    final user = authProvider.currentUser;
    if (user == null) {
      emit(const AuthStateLoggedOut(
        exception: null,
        status: AuthStatus.notLoading,
      ));
    } else if (!user.isEmailVerified) {
      emit(const AuthStateNeedsVerification(status: AuthStatus.notLoading));
    } else {
      emit(AuthStateLoggedIn(user: user, status: AuthStatus.notLoading));
    }
  }

  void register(String email, String password) async {
    try {
      await authProvider.createUser(
        email: email,
        password: password,
      );
      await authProvider.sendEmailVerification();
      emit(const AuthStateNeedsVerification(status: AuthStatus.notLoading));
    } on Exception catch (e) {
      emit(AuthStateRegistering(
        exception: e,
        status: AuthStatus.notLoading,
      ));
    }
  }

  void logIn(String email, String password) async {
    emit(const AuthStateLoggedOut(
        exception: null,
        status: AuthStatus.loading,
        loadingText: 'Please wait...'));
    try {
      final user = await authProvider.logIn(email: email, password: password);
      if (!user.isEmailVerified) {
        emit(const AuthStateLoggedOut(
          exception: null,
          status: AuthStatus.notLoading,
        ));
        emit(const AuthStateNeedsVerification(status: AuthStatus.notLoading));
      } else {
        emit(AuthStateLoggedIn(user: user, status: AuthStatus.notLoading));
      }
    } on Exception catch (e) {
      emit(AuthStateLoggedOut(exception: e, status: AuthStatus.notLoading));
    }
  }

  void logOut() async {
    try {
      await authProvider.logOut();
      emit(const AuthStateLoggedOut(
        exception: null,
        status: AuthStatus.notLoading,
      ));
    } on Exception catch (e) {
      emit(AuthStateLoggedOut(
        exception: e,
        status: AuthStatus.notLoading,
      ));
    }
  }
}
