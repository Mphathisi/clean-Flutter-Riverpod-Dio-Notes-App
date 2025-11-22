import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';
import '../screens/add_edit_note_screen.dart';

class NoteTile extends ConsumerWidget {
  final Note note;
  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddEditNoteScreen(note: note)),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => ref.read(noteListProvider.notifier).deleteNote(note.id!),
            ),
          ],
        ),
      ),
    );
  }
}
