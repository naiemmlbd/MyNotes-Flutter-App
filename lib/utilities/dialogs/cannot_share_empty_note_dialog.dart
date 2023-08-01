import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Sharing',
    content: 'You can not share an empty note!',
    optionBuilder: () => {
      'Ok': null,
    },
  );
}