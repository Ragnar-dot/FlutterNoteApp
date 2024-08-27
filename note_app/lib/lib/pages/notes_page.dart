import 'package:flutter/material.dart';
import 'package:note_app/main.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage ({super.key});

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
        //create button
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
  textController.text =note.text;
  showDialog(context: context, builder: (context) => AlertDialog(
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
            // pop dialog
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

context.read<NoteDatabase>().deleteNote (id);

}


  @override
  Widget build(BuildContext context) {



    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes

  List<Note> currentNotes = noteDatabase.currentsnotes;


    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];



        // list title UI
          return ListTile(
            title: Text(note.text),
            // ignore: prefer_const_constructors
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
    );

  }
}

