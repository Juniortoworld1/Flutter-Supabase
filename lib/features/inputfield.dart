
import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget{
  final String label ;
  final String hint ;
  final TextEditingController controller ;
  final TextInputType keyboardType ;
  final bool isPassword ;
  final IconData? icon ;
  final String ? Function(String?)? validator ;

  const Inputfield({
    super.key ,
    required this.label ,
    required this.controller  ,
    this.hint = '' ,
    this.keyboardType = TextInputType.text ,
    this.isPassword = false ,
    required this.validator, this.icon ,

  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator:  validator,
      decoration: InputDecoration(
        labelText: label ,
        hintText: hint ,
        prefixIcon: icon!=null?Icon(icon):null ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
              borderSide:  const BorderSide(color: Colors.grey) ,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey) ,
          borderRadius: BorderRadius.circular(12.0)
        ) ,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0) ,
          borderSide: BorderSide(color: Theme.of(context).primaryColor , width: 2)
        )

      ),
    );
  }


}