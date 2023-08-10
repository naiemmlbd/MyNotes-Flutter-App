import 'package:flutter/foundation.dart' show immutable;
import 'package:mynotes/services/auth/auth_user.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthState {
  final AuthStatus status;

  final String? loadingText;
  const AuthState({
    required this.status,
    this.loadingText = 'Please wait a moment',
  });
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required AuthStatus status})
      : super(status: status);
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering({
    required this.exception,
    required AuthStatus status,
  }) : super(status: status);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({
    required this.user,
    required AuthStatus status,
  }) : super(status: status);
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({
    required AuthStatus status,
  }) : super(status: status);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required AuthStatus status,
    String? loadingText,
  }) : super(
          status: status,
          loadingText: loadingText,
        );

  @override
  List<Object?> get props => [exception, status];
}

enum AuthStatus {
  loading,
  notLoading,
}
