import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const AuthStatus._();
  const factory AuthStatus.unInitialized() = _UnInitialized;
  const factory AuthStatus.loggedIn() = _LoggedIn;
  const factory AuthStatus.verification() = _Verification;
  const factory AuthStatus.loggedOut() = _LoggedOut;
  const factory AuthStatus.registering() = _Registering;

  bool get isUnInitialized => this == const AuthStatus.unInitialized();
  bool get isLoggedIn => this == const AuthStatus.loggedIn();
  bool get needsVerification => this == const AuthStatus.verification();
  bool get isLoggedOut => this == const AuthStatus.loggedOut();
  bool get isRegistering => this == const AuthStatus.registering();
}
