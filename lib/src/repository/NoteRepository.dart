import '../models/note.dart';
import '../services/note_service.dart';

class NoteRepository {
  final NoteService service;

  NoteRepository(this.service);

  Future<List<Note>> getNotes() => service.getNotes();
  Future<Note> addNote(Note note) => service.addNote(note);
  Future<Note> updateNote(Note note) => service.updateNote(note);
  Future<void> deleteNote(int id) => service.deleteNote(id);
}
