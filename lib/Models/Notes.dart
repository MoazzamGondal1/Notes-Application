import 'package:flutter/material.dart';
import 'package:notes/components/TitleBar.dart';
import 'package:random_color/random_color.dart';
import 'dart:math' as math;
import '../Screens/Notepad.dart';
import '../components/DescriptionBar.dart';

RandomColor _randomColor = RandomColor();
Color? acolor ;

class Note extends StatefulWidget {

  String? title;
  String? des;
  Note({this.title,this.des});

  @override

  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  String n='\n';

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ()async{
        List content= await Navigator.push(context, MaterialPageRoute(builder: (context)=>Notepad(obj: widget)));
        setState((){
          widget.title=content[0];
          widget.des=content[1];

        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: acolor = _randomColor.randomColor(
            colorSaturation: ColorSaturation.lowSaturation,
            colorBrightness: ColorBrightness.veryLight,
            colorHue: ColorHue.orange,
          ),
        ),

        child: Column(
          children: [
            Text(widget.title.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,),),
            Text(n+widget.des.toString(),style: TextStyle(color: Colors.black54,fontSize: 15)),
          ],
        ),

      ),
    );
  }
}

List<Note> Notes=[];
