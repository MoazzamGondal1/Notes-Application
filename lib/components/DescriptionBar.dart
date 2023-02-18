import 'package:flutter/material.dart';

TextEditingController des=TextEditingController();

class DesBar extends StatefulWidget {
  const DesBar({Key? key}) : super(key: key);

  @override
  State<DesBar> createState() => _DesBarState();
}

class _DesBarState extends State<DesBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: des,
      style: TextStyle(color: Colors.white,fontSize: 16,),
      cursorColor: Colors.white,
      cursorHeight: 27,
      maxLines: 9999,
      decoration: InputDecoration(
        hintText: 'Write Description',
        hintStyle: TextStyle(color: Colors.grey[850]),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
