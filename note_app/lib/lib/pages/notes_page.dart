import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:isar/isar.dart";
import "package:note_app/models/note.dart";
import "package:note_app/models/note_database.dart";
import "package:path_provider/path_provider.dart";
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
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 45,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          // list of notes
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];
                // list title UI
                return ListTile(
                  title: Text(note.text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // edit button
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => updateNote (note),
                      ),
                      // delete button
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteNote (note.id),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}