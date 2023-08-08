import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_state.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authProvider)
      : super(const AuthStateUninitialized(isLoading: true));

  final FirebaseAuthProvider authProvider;

  void sendEmailVerification() async {
    await authProvider.sendEmailVerification();
    emit(state);
  }

  void shouldRegister() {
    emit(const AuthStateRegistering(
      exception: null,
      isLoading: false,
    ));
  }

  void initialize() async {
    await authProvider.initialize();
    final user = authProvider.currentUser;
    if (user == null) {
      emit(const AuthStateLoggedOut(
        exception: null,
        isLoading: false,
      ));
    } else if (!user.isEmailVerified) {
      emit(const AuthStateNeedsVerification(isLoading: false));
    } else {
      emit(AuthStateLoggedIn(user: user, isLoading: false));
    }
  }

  void register(String email, String password) async {
    try {
      await authProvider.createUser(
        email: email,
        password: password,
      );
      await authProvider.sendEmailVerification();
      emit(const AuthStateNeedsVerification(isLoading: false));
    } on Exception catch (e) {
      emit(AuthStateRegistering(
        exception: e,
        isLoading: false,
      ));
    }
  }

  void logIn(String email, String password) async {
    emit(const AuthStateLoggedOut(
        exception: null, isLoading: true, loadingText: 'Please wait...'));
    try {
      final user = await authProvider.logIn(email: email, password: password);
      if (!user.isEmailVerified) {
        emit(const AuthStateLoggedOut(
          exception: null,
          isLoading: false,
        ));
        emit(const AuthStateNeedsVerification(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(user: user, isLoading: false));
      }
    } on Exception catch (e) {
      emit(AuthStateLoggedOut(exception: e, isLoading: false));
    }
  }

  void logOut() async {
    try {
      await authProvider.logOut();
      emit(const AuthStateLoggedOut(
        exception: null,
        isLoading: false,
      ));
    } on Exception catch (e) {
      emit(AuthStateLoggedOut(
        exception: e,
        isLoading: false,
      ));
    }
  }
}
