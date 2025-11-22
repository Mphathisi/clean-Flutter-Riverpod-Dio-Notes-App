import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/note_provider.dart';
import '../widgets/note_tile.dart';
import 'add_edit_note_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(noteListProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddEditNoteScreen()),
        ),
        child: Icon(Icons.add),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: Duration(milliseconds: 400),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: NoteTile(note: note),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
