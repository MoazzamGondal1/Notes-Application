import 'package:flutter/material.dart';
import '../../components/loading.dart';
import '../../services/auth.dart';
import '../Home.dart';

class SignIn extends StatefulWidget {
  final Function? toggle;
  SignIn({this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  String error='';
  String email='';
  String password='';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
              widget.toggle!();
            },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                ),
                icon: Icon(Icons.app_registration, color: Colors.orangeAccent,),
                label: Text(
                  'Register', style: TextStyle(color: Colors.orangeAccent),)),
          ),
        ],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Divider(color: Colors.orangeAccent,thickness: 2,),
              Expanded(flex:1,child: SizedBox(height: 170)),
              Text('Sign In to Notes',style: TextStyle(color: Colors.orangeAccent,fontSize: 25),),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,30,20,20),
                child: TextFormField(
                  validator: (val)=> val!.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6.0)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                  cursorColor: Colors.amber,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,10,20,30),
                child: TextFormField(
                  obscureText: true,
                  validator: (val)=> val!.isEmpty ? 'Password must be longer than 6 characters' : null,
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6.0)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                  ),
                  cursorColor: Colors.amber,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailPassword(email, password);
                      if(result==null){
                        setState(() {
                          error='Could not login with these credentials';
                          loading=false;
                        });
                      }
                    }
                  },
                  icon: Icon(Icons.login_sharp,color: Colors.black,),
                  label : Text('Sign In',style: TextStyle(fontSize: 20,color: Colors.black),)
              ),
              SizedBox(height: 15),
              Text(error,style: TextStyle(color: Colors.red)),
              Expanded(flex:1,child: SizedBox(height: 10))
            ],
          ),
        )
    )
    );
  }
}
