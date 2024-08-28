import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:note_app/theme/theme_provider.dart";
import "package:provider/provider.dart";

class SettingsPage extends StatelessWidget {
const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 60,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          color:  const Color.fromARGB(181, 105, 105, 105),
          borderRadius: BorderRadius .circular(50),
        ),
        
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25), // Add the desired padding value here
          margin: const EdgeInsets.only(left: 25, right: 25, top: 20), // Add the desired margin value here
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              
              // Dark Mode
              const Text("Dark Mode"),
              // Switch toogle
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}