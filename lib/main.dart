
import 'package:flutter/material.dart';
import 'package:note_app_offline_database_trail08/model/note_database.dart';
import 'package:note_app_offline_database_trail08/pages/note_page.dart';
import 'package:note_app_offline_database_trail08/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBase.initilize();

  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create:(context) => NoteDataBase()),
    ChangeNotifierProvider(create:(context) => ThemeProvider(),)
  ],
   child: const MyApp(),)
  );
  
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     
     home: NotePage(),
     theme: Provider.of<ThemeProvider>(context).themeData,
     
     );
  }
}
