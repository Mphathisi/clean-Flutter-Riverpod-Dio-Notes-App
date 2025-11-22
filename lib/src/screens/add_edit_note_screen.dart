import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';

class AddEditNoteScreen extends ConsumerStatefulWidget {
  final Note? note;
  const AddEditNoteScreen({super.key, this.note});

  @override
  ConsumerState<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends ConsumerState<AddEditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? "");
    contentController = TextEditingController(text: widget.note?.content ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? "Edit Note" : "Add Note")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: "Title")),
            SizedBox(height: 16),
            TextField(controller: contentController, decoration: InputDecoration(labelText: "Content")),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final note = Note(
                  id: widget.note?.id,
                  title: titleController.text,
                  content: contentController.text,
                );
                final notifier = ref.read(noteListProvider.notifier);
                if (isEditing) {
                  notifier.updateNote(note);
                } else {
                  notifier.addNote(note);
                }
                Navigator.pop(context);
              },
              child: Text(isEditing ? "Update" : "Add"),
            )
          ],
        ),
      ),
    );
  }
}
