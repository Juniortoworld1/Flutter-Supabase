import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_01/animated_screens/animate_screen_for_login.dart';
import 'package:flutter_supabase_01/textfile/self.dart';
import 'package:flutter_supabase_01/textfile/simple.dart';

void main(){
  runApp(simpledata()) ;
}

class simpledata extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Putting simple data like text ",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimateScreenForLogin(),
    ) ;
  }

}