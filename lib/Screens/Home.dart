import 'package:flutter/material.dart';
import 'package:notes/Screens/wrapper.dart';

import '../Models/Notes.dart';
import '../components/SearchBar.dart';
import '../services/auth.dart';
import 'Notepad.dart';

class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('My Notes',style: TextStyle(color: Colors.orangeAccent)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton.icon(onPressed: () async {
              await _auth.sign_Out();
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Wrapper()));
            },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
                icon: Icon(Icons.logout, color: Colors.orangeAccent,),
                label: Text(
                  'Sign Out', style: TextStyle(color: Colors.orangeAccent),)),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(color: Colors.orangeAccent,thickness: 2,),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,30.0,8.0,8.0),
            child: SearchBar(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0,15,8,8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),
                itemBuilder:(context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notepad(obj: Notes[index],)));
                      setState((){
                      });
                    },
                    child: Notes[index],
                  );
                  
              },
              itemCount: Notes.length,),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          List content = await Navigator.push(context, MaterialPageRoute(builder: (context)=> Notepad()));
          String Title=content[0];
          String Des=content[1];
          setState((){
            Notes.add(Note(title: Title,des: Des,));
          });
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add,size: 40,),
      ),
    );
  }
}
