import 'package:flutter/material.dart';
import 'package:notes/Screens/Authenticate/register.dart';
import 'package:notes/Screens/Authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signin = true;
  void toggle(){
    setState(() {
      signin = !signin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signin){
      return SignIn(toggle : toggle);
    }else{
      return Register(toggle: toggle);
    }
  }
}
