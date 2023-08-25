import 'package:freezed_annotation/freezed_annotation.dart';
import '../notes_service.dart';
part 'database_note.freezed.dart';

@freezed
class DatabaseNote with _$DatabaseNote {
  const factory DatabaseNote({
    required int id,
    required int userId,
    required String text,
    required bool isSyncedWithCloud,
  }) = _DatabaseNote;

  factory DatabaseNote.fromRow(Map<String, Object?> map) {
    return DatabaseNote(
      id: map[idColumn] as int,
      userId: map[userIdColumn] as int,
      text: map[textColumn] as String,
      isSyncedWithCloud:
          (map[isSyncedWithCloudColumn] as int) == 1 ? true : false,
    );
  }
}
