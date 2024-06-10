import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_offline_database_trail08/components/drawer.dart';
import 'package:note_app_offline_database_trail08/components/noteTile.dart';

import 'package:note_app_offline_database_trail08/model/note.dart';
import 'package:note_app_offline_database_trail08/model/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readNote();
  }

  final textController = TextEditingController();

  //creat
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add your Note'),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDataBase>().addNote(textController.text);
              Navigator.pop(context);
            },
            child: Text('create'),
          )
        ],
      ),
    );
  }

  //read
  void readNote() {
    context.read<NoteDataBase>().fetchNote();
  }

  //update
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('update Note'),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              //update db
              context
                  .read<NoteDataBase>()
                  .updateNote(note.id, textController.text);

              //pop dailog
              Navigator.pop(context);
              //cleare
            },
            child: Text('update'),
          )
        ],
      ),
    );
  }

  //delete
  void deleteNote(int id) {
    context.read<NoteDataBase>().deleteNote(id);
  }






  @override
  Widget build(BuildContext context) {
    final note_data_base = context.watch<NoteDataBase>();
    List<Note> currentNotes = note_data_base.currentNote;

    return Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add,color: Theme.of(context).colorScheme.inversePrimary,),
      ),

      //drawer
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //title
         Padding(
           padding: const EdgeInsets.all(25.0),
           child: Text(
             'Note',
             style: GoogleFonts.dmSerifText(
               textStyle: TextStyle(
                 color: Theme.of(context).colorScheme.inversePrimary,
                 fontSize: 48.0, // Adjust this value to your desired font size
               ),
             ),
           ),
         ),


          //list view
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (BuildContext context, int index) {
                //call indivisual note
                final note = currentNotes[index];
                return NoteTile(text: note.text,
                //delete function
               
                 onEdit: () => updateNote(note),
                  onDelet: ()=>deleteNote(note.id),
                
                
                
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
