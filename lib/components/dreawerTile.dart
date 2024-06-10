import 'package:flutter/material.dart';

class DrawwerTile extends StatelessWidget {
  Widget leading;
  String title;
  void Function()? onTap;
  DrawwerTile({super.key,required this.leading,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        
        onTap:onTap ,
        leading: leading,
        title: Text(title,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),
      ),
    );
  }
}