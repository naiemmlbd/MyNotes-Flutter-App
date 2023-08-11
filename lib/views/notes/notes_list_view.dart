import 'package:flutter/material.dart';
import '../../services/crud/models/database_note.dart';
import '../../utilities/dialogs/delete_dialog.dart';

typedef NoteCallback = void Function(DatabaseNote note);

class NotesListView extends StatelessWidget {
  final List<DatabaseNote> notes;
  final NoteCallback onDelete;
  final NoteCallback onTap;

  const NotesListView(
      {super.key,
      required this.notes,
      required this.onDelete,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            color: Colors.yellowAccent,
            clipBehavior: Clip
                .antiAlias, // Set the clip behavior to achieve rounded corners
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Set the desired border radius
            ),
            child: ListTile(
              onTap: () {
                onTap(note);
              },
              title: Text(
                note.text,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () async {
                  final shouldDelete = await showDeleteDialog(context);
                  if (shouldDelete) {
                    onDelete(note);
                  } else {}
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
