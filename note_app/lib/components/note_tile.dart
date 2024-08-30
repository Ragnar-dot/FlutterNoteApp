import "package:flutter/material.dart";

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
  // ignore: library_private_types_in_public_api
  _NoteTileState createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  bool isChecked = false;

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