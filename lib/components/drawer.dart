import 'package:flutter/material.dart';
import 'package:note_app_offline_database_trail08/components/dreawerTile.dart';
import 'package:note_app_offline_database_trail08/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
  shadowColor: Colors.white ,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        
        children: [
          //header
          DrawerHeader(child: Icon(Icons.edit)),

          //notepagetile
          DrawwerTile(leading: Icon(Icons.note), title: 'Note Page',onTap: (){
            Navigator.pop(context);
          },),

          //settings tile
          DrawwerTile(leading: Icon(Icons.settings), title: 'Setting',onTap: (){
            Navigator.of(context);
            Navigator.push(context, MaterialPageRoute(builder:(context) => SettingsPage(),));
          }),
        
        ],
      ),
    );
  }
}