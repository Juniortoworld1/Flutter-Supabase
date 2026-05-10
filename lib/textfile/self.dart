import 'package:flutter/material.dart';



class Self_made extends StatefulWidget {
  const Self_made({super.key});

  @override
  State<Self_made> createState() => _Self_madeState();
}

class _Self_madeState extends State<Self_made> {

  bool _isExpanded = false;

  @override

  void initState(){
    super.initState() ;
    Future.delayed(const Duration(milliseconds: 100) , () {
      setState(() {
        _isExpanded = true;
      });
    }) ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
          duration: Duration(seconds: 4) ,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: _isExpanded?Alignment.topRight:Alignment.bottomLeft,
              end: _isExpanded?Alignment.bottomRight:Alignment.topLeft,
              colors: [Colors.pinkAccent , Colors.white])
        ),
        onEnd: () => setState(() => _isExpanded = !_isExpanded),
      ),
    ) ;
  }
}
