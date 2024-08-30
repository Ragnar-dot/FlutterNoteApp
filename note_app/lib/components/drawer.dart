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
          DrawerHeader(
            child:  Image.asset('assets/home.png', width: 40, height: 40),
          ),



         // Notes tile
          DrawerTile(
            title: ("Notes"),
            leading: Image.asset('assets/home.png', width: 40, height: 40),
            onTap: () => Navigator.pop(context,),
          ),


          // Settings tile
          DrawerTile(
            title: ("Settings"),
            leading: Image.asset('assets/settings.png', width: 40, height: 40),
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