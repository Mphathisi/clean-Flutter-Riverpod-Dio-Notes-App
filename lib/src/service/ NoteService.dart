import 'package:dio/dio.dart';
import '../../../core/dio_client.dart';
import '../models/note.dart';

class NoteService {
  final DioClient client;

  NoteService(this.client);

  Future<List<Note>> getNotes() async {
    try {
      final response = await client.dio.get("/notes");
      return (response.data as List)
          .map((json) => Note.fromJson(json))
          .toList();
    } catch (_) {
      throw Exception("Failed to fetch notes");
    }
  }

  Future<Note> addNote(Note note) async {
    try {
      final response =
      await client.dio.post("/notes", data: note.toJson());
      return Note.fromJson(response.data);
    } catch (_) {
      throw Exception("Failed to add note");
    }
  }

  Future<Note> updateNote(Note note) async {
    final response = await _dio.put('/${note.id}', data: note.toJson()); // use client
    return Note.fromJson(response.data);
  }

  Future<void> deleteNote(int id) async {
    await _dio.delete('/$id');
  }

}


// abstract class NoteService {
//   Future<List<Note>> getNotes();
//   Future<Note> addNote(Note note);
// }
