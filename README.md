# Flutter Notes App
**Technologies:** Flutter, Riverpod, Dio, Hive, Animations

A clean architecture notes app

---

## Project Structure

```text
lib/
├─ main.dart
├─ app.dart
├─ models/
│   └─ note.dart                # Note data model (Hive + JSON serializable)
├─ services/
│   └─ note_service.dart        # API layer using Dio
├─ repositories/
│   └─ note_repository.dart     # Repository layer: abstracts service and local cache
├─ providers/
│   └─ note_provider.dart       # Riverpod StateNotifier controller
├─ screens/
│   ├─ home_screen.dart         # Main notes list screen
│   └─ add_edit_note_screen.dart# Add/Edit note screen
├─ widgets/
│   └─ note_tile.dart           # Reusable note card widget
└─ utils/
    └─ animations.dart          # Animation helpers for UI

