import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:note_app_offline_database_trail08/model/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDataBase extends ChangeNotifier{

  static late Isar isar;
  //initilize database
 static Future<void>initilize()async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //list of current notes
 final List<Note>currentNote=[];

  //creat 
  Future<void>addNote(String textFromUser)async{
    //define moedl text this method text and the variable text are the same
      final newText=Note()..text = textFromUser;
        //put the text to model and save it to th edata base
     await isar.writeTxn(() => isar.notes.put(newText));

    //re-read from bd
    fetchNote();

  }


  //read
  Future<void>fetchNote()async{
    List<Note> fetchedNote =await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(fetchedNote);
    notifyListeners();
  }

  //update
  Future<void>updateNote(int id, String newText)async{
    final existingNote = await isar.notes.get(id);
    if(existingNote != null){
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNote();
    }
  }

  //delete
  Future<void>deleteNote(int id)async{
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
    
  }
}