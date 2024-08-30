import 'package:flutter/material.dart';
import 'package:note_app/models/note_database.dart';
import 'package:note_app/lib/pages/notes_page.dart';
import 'package:note_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{

  // initialize - note isar database
WidgetsFlutterBinding.ensureInitialized();
await NoteDatabase.init();
await Hive.initFlutter();
await Hive.openBox('noteBox');


  runApp(
    MultiProvider(providers: [
      // Note Provider
      ChangeNotifierProvider(create: (context) => NoteDatabase()),
      // Theme Provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeMode,

    );
  }


}

