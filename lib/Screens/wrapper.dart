import 'package:flutter/material.dart';
import 'package:notes/Screens/Home.dart';
import 'package:notes/Screens/Authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import '../Models/MyUser.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<My_User?>(context);
    if (user!=null){
      return Home();
    }else  {
      return Authenticate();
    }
  }
}
