import 'package:flutter/material.dart';

TextEditingController title=TextEditingController();


class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: title,
      style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
      cursorColor: Colors.white,
      cursorHeight: 27,
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(color: Colors.grey[850]),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
