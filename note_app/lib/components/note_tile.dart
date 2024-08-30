import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NoteTile extends StatefulWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  late Box noteBox;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    noteBox = Hive.box('noteBox');
    _loadIsChecked();
  }

  // Load the isChecked value from Hive
  void _loadIsChecked() {
    setState(() {
      isChecked = noteBox.get('isChecked_${widget.text}', defaultValue: false);
    });
  }

  // Save the isChecked value to Hive
  void _saveIsChecked(bool value) {
    noteBox.put('isChecked_${widget.text}', value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(77, 225, 224, 226),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: ListTile(
        title: Text(widget.text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkbox
            SizedBox(
              width: 50,
              height: 50,
              child: Checkbox(
                value: isChecked,
                activeColor: const Color.fromARGB(255, 31, 183, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool!;
                    _saveIsChecked(isChecked);
                  });
                },
              ),
            ),
            IconButton(
              onPressed: widget.onEditPressed,
              icon: Image.asset('assets/edit.png', width: 40, height: 40),
            ),
            IconButton(
              onPressed: widget.onDeletePressed,
              icon: Image.asset('assets/delete.png', width: 40, height: 40),
            ),
          ],
        ),
      ),
    );
  }
}