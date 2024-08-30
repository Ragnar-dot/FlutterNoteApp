import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  
  final dynamic onTap;

  const DrawerTile({super.key,
   required this.title,
  required this.leading,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0),
      child: ListTile(
        title: Text(
          title,
        style: const TextStyle(color: Color.fromARGB(255, 98, 1, 143)),
      ),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}


