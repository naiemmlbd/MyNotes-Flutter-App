import 'package:freezed_annotation/freezed_annotation.dart';
import '../notes_service.dart';
part 'database_user.freezed.dart';

@freezed
class DatabaseUser with _$DatabaseUser {
  const factory DatabaseUser({
    required int id,
    required String email,
  }) = _DatabaseUser;

  factory DatabaseUser.fromRow(Map<String, Object?> map) {
    return DatabaseUser(
      id: map[idColumn] as int,
      email: map[emailColumn] as String,
    );
  }
}
