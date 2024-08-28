import 'package:flutter/material.dart';
import 'package:note_app/components/drawer_tile.dart';
import 'package:note_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const DrawerHeader(
            child:  Icon(Icons.home),
          ),



         // Notes tile
          DrawerTile(
            title: ("Notes"),
            leading: const Icon(Icons.home),
            onTap: () => Navigator.pop(context,),
          ),


          // Settings tile
          DrawerTile(
            title: ("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () { 
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));

            }
          ),
              
        ],
      ),
        
    );

  }
}