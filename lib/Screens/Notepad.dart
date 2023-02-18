import 'package:flutter/material.dart';
import '../Models/Notes.dart';
import '../components/DescriptionBar.dart';
import '../components/TitleBar.dart';
import 'Home.dart';

class Notepad extends StatefulWidget {
  Note? obj;
  Notepad({this.obj});
  @override

  State<Notepad> createState() => _NotepadState();
}


class _NotepadState extends State<Notepad> {
  bool delete = true;
  void edit() {
    if (widget.obj != null) {
      delete=true;
    }
    else{
      delete = false;
    }
  }
  @override
  initState(){
   title.text = '';
   des.text = '';
  }
  Widget build(BuildContext context) {
    edit();
    if(delete) {
      title = TextEditingController(text: widget.obj!.title);
      des = TextEditingController(text: widget.obj!.des);
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text('My Notes', style: TextStyle(color: Colors.orangeAccent)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton.icon(onPressed: () {
                Navigator.pop(context, [title,des]);
              },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                  ),
                  icon: Icon(Icons.delete, color: Colors.orangeAccent,),
                  label: Text(
                    'Delete', style: TextStyle(color: Colors.orangeAccent),)),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0),
              child: TitleBar(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: DesBar(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String Title = title.text;
            String Des = des.text;
            Navigator.pop(context, [Title, Des]);
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.save, size: 40,),
        ),
      );
    }
    else{
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text('My Notes', style: TextStyle(color: Colors.orangeAccent)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0),
              child: TitleBar(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: DesBar(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String Title = title.text;
            String Des = des.text;
            Navigator.pop(context, [Title, Des]);
          },
          backgroundColor: Colors.orange,
          child: Icon(Icons.save, size: 40,),
        ),
      );
    }
  }
}
