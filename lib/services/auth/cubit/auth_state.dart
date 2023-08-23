part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required BaseStatus status,
    required AuthStatus authStatus,
    required AuthUser user,
  }) = _AuthState;
}
