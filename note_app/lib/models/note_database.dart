import "package:isar/isar.dart";
import "package:note_app/models/note.dart";
import "package:path_provider/path_provider.dart";



class NoteDatabase {
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
  List<Note> fetchNotes
}


// update -  a note in database


// delete - a note from database



}