import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  void Function()? onEdit;
  void Function()? onDelet;
  final String text;
  NoteTile(
      {super.key,
      required this.text,
      required this.onDelet,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //edit button
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),

            //delete button
            IconButton(onPressed: onDelet, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
