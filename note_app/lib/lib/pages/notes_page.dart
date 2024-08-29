
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:note_app/components/drawer.dart";
import "package:note_app/components/note_tile.dart";

import "package:note_app/models/note.dart";
import "package:note_app/models/note_database.dart";

import "package:provider/provider.dart";

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // on app startup, fetch existing notes
    readNotes();
  }

  // create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create a Note"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          // create button
          MaterialButton(
            
            onPressed: () {
              context.read<NoteDatabase>().addNote(textController.text);
              

              // clear text field
              textController.clear();

              // pop dialog
              Navigator.pop(context);
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  // read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update a note
  void updateNote(Note note) {
    // pre-fill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Note"),
        content: TextField(controller: textController),
        actions: [
          // update button
          MaterialButton(
            onPressed: () {
              // update note
              context.read<NoteDatabase>().updateNote(
                    note.id,
                    textController.text,
                  );

              // clear text field
              textController.clear();
              // pop dialog box
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  // delete a note
  void deleteNote (int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 30,  //In Flutter, das elevation-Attribut in der AppBar-Komponente bezieht sich auf den Schatten oder die Höhe der AppBar relativ zum Hintergrund.
                      // Genauer gesagt, gibt es an, wie stark die AppBar über dem Inhalt darunter "schwebt".
        backgroundColor: const Color.fromARGB(255, 92, 29, 165),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),


      drawer: const MyDrawer(),
      body: Column(
        
        children: [
          // Header
          Padding(
                
            padding: const EdgeInsets.all(20.0), 
            child: Text(
              "Notes",                                // Header text
              style: GoogleFonts.pacifico(
                fontSize: 50,
                color: Theme.of(context).colorScheme.primary,
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromARGB(255, 117, 35, 250), // underline color
              ),
            ),
          ),
          // list of notes
          Expanded( // Expanded widget to fill the remaining space
            child: ListView.builder( // ListView.builder to display the list of notes
              itemCount: currentNotes.length, // number of notes
              itemBuilder: (context, index) {
                final note = currentNotes[index];
                // list title UI
                return NoteTile(text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}