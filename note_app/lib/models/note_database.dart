import "package:flutter/foundation.dart";
import "package:isar/isar.dart";
import "package:note_app/models/note.dart";
import "package:path_provider/path_provider.dart";



class NoteDatabase extends ChangeNotifier {
  static late Isar isar;


// initialize - Database
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
       directory: dir.path,
       );
  }
    
// list of notes
  final List<Note> currentsnotes = [];

// create - a note and save to database
  Future<void> addNote (String text) async {
    final newNote = Note()..text = text;
    
  
// save - a note to database
await isar.writeTxn(() => isar.notes.put(newNote));
    
// re read - notes from database
  fetchNotes();




}
// read - notes from database
Future<void> fetchNotes() async {
  List<Note> fetchNotes = await isar.notes.where().findAll();
  currentsnotes.clear();
  currentsnotes.addAll(fetchNotes);
  notifyListeners();
}


// update -  a note in database

Future<void> updateNote (int id, String newtext) async {
  final existingNote = await isar.notes.get(id);
  if (existingNote != null) {
    await isar.writeTxn(() => isar.notes.put(existingNote));
    await fetchNotes();
  
  	}
  }



// delete - a note from database
Future<void> deleteNote (int id) async {
  await isar.writeTxn(() => isar.notes.delete(id));
  await fetchNotes();

}

  static initialize() {}
  


}