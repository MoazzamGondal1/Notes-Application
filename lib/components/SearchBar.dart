import 'package:flutter/material.dart';
import 'dart:ui';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorHeight: 22,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white10,
          focusColor: Colors.white10,
          //HoverColor: Colors.black12,
          hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        prefixIconColor: Colors.orange,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
      ),
    );
  }
}
