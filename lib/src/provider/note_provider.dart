import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note.dart';
import '../repositories/note_repository.dart';
import '../services/note_service.dart';

class NoteNotifier extends StateNotifier<List<Note>> {

  final NoteRepository repository;
  NoteNotifier(this.repository) : super([]) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    final notes = await repository.getNotes();
    state = notes;
  }

  Future<void> addNote(Note note) async {
    final newNote = await repository.addNote(note);
    state = [...state, newNote];
  }

  Future<void> updateNote(Note note) async {
    final updatedNote = await repository.updateNote(note);
    state = state.map((n) => n.id == updatedNote.id ? updatedNote : n).toList();
  }

  Future<void> deleteNote(int id) async {
    await repository.deleteNote(id);
    state = state.where((n) => n.id != id).toList();
  }
}

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return NoteRepository(NoteService());
});

final noteListProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  final repo = ref.read(noteRepositoryProvider);
  return NoteNotifier(repo);
});
