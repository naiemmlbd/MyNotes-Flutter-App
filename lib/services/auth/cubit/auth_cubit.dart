import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mynotes/common/auth_status.dart';
import 'package:mynotes/common/base_status.dart';
import 'package:mynotes/services/auth/auth_user.dart';
import 'package:mynotes/services/auth/firebase_auth_provider.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authProvider)
      : super(
          const AuthState(
            status: BaseStatus.initial(),
            authStatus: AuthStatus.unInitialized(),
            user: AuthUser(email: '', isEmailVerified: false),
          ),
        );

  final FirebaseAuthProvider authProvider;

  void sendEmailVerification() async {
    await authProvider.sendEmailVerification();
    emit(state);
  }

  void shouldRegister() {
    debugPrint('State: .......>>>>>');

    emit(state.copyWith(
        authStatus: const AuthStatus.registering(),
        status: const BaseStatus.success()));
  }

  void initialize() async {
    await authProvider.initialize();
    final user = authProvider.currentUser;
    if (user == null) {
      emit(state.copyWith(
          authStatus: const AuthStatus.loggedOut(),
          status: const BaseStatus.success()));
    } else if (!user.isEmailVerified) {
      emit(state.copyWith(
          authStatus: const AuthStatus.verification(),
          status: const BaseStatus.success()));
    } else {
      emit(state.copyWith(
          authStatus: const AuthStatus.loggedIn(),
          status: const BaseStatus.success()));
    }
  }

  void register(String email, String password) async {
    emit(state.copyWith(status: const BaseStatus.loading()));
    try {
      await Future.delayed(const Duration(seconds: 1));
      await authProvider.createUser(
        email: email,
        password: password,
      );
      await authProvider.sendEmailVerification();
      emit(state.copyWith(
          authStatus: const AuthStatus.verification(),
          status: const BaseStatus.success()));
    } on Exception catch (e) {
      emit(state.copyWith(status: BaseStatus.failed(e)));
    }
  }

  void logIn(String email, String password) async {
    try {
      final user = await authProvider.logIn(email: email, password: password);
      if (!user.isEmailVerified) {
        emit(state.copyWith(
            authStatus: const AuthStatus.verification(),
            status: const BaseStatus.success()));
      } else {
        emit(state.copyWith(
            authStatus: const AuthStatus.loggedIn(),
            status: const BaseStatus.success()));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          authStatus: const AuthStatus.loggedOut(),
          status: BaseStatus.failed(e)));
    }
  }

  void logOut() async {
    try {
      await authProvider.logOut();
      emit(state.copyWith(
          authStatus: const AuthStatus.loggedOut(),
          status: const BaseStatus.success()));
    } on Exception catch (e) {
      emit(state.copyWith(
          authStatus: const AuthStatus.loggedOut(),
          status: BaseStatus.failed(e)));
    }
  }
}
