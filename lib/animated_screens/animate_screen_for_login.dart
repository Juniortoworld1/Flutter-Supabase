
import 'package:flutter/material.dart';
import 'package:flutter_supabase_01/features/inputfield.dart';

class AnimateScreenForLogin extends StatefulWidget {
  const AnimateScreenForLogin({super.key});

  @override
  State<AnimateScreenForLogin> createState() => _AnimateScreenForLoginState();
}

class _AnimateScreenForLoginState extends State<AnimateScreenForLogin> {
  bool _isExpanded = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController() ;
  TextEditingController _passwordController = TextEditingController() ;



  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
        duration: const Duration(seconds: 4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.withOpacity(0.8), Colors.blueAccent.withOpacity(0.8)],
            begin: _isExpanded ? Alignment.topRight : Alignment.bottomLeft,
            end: _isExpanded ? Alignment.bottomLeft : Alignment.topRight,
          ),
        ),
        onEnd: () => setState(() => _isExpanded = !_isExpanded),

        child: Center(
          child: SingleChildScrollView(
            child: AnimatedContainer(
              width: screenWidth*0.8 ,
              height: screenWidth*0.7,
              duration: const Duration(milliseconds: 200) ,
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.5)  ,
                borderRadius: BorderRadius.circular(30)  ,
                border: Border.all(color: Colors.white.withOpacity(0.5)),
                boxShadow: [BoxShadow(blurStyle: BlurStyle.outer , spreadRadius: 5 , blurRadius: 10 )]
              ),

              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Inputfield(label: "Gmail",hint: "Enter your Gmail", controller: _emailController, validator: (value) {
                            if (value == null || value.isEmpty){
                              return 'Please enter some text';
                            }
                            if (!value.contains("@")){
                              return 'please enter a valid email' ;
                            }
                          } ) ,

                          SizedBox(height: 18,) ,

                          Inputfield(label: "Password"  ,hint: "Enter your password ", keyboardType: TextInputType.number, controller: _passwordController, validator: (value) {
                            if (value == null || value.isEmpty){
                              return 'Please enter some text';
                            }
                            if (value.length<8 ||  value.length>15){
                              return 'please be in limit and enter the password' ;
                            }
                          } ) ,

                          SizedBox(height: 18,) ,

                          Container(
                            width: double.infinity,
                            child: ElevatedButton(onPressed: (){
                              if (_formKey.currentState!.validate()){print("you are good to go ") ;} else{print("sorry") ; }
                            }, style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.4), // Makes the button see-through
                              shadowColor: Colors.blue.withOpacity(0.4),     // Removes the default shadow
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90),
                              ),) , 
                              child: Text("Login" , style: TextStyle(fontSize: 20  , color: Colors.black ),) , ),
                          )
                        ],
                      )),
                ),
              )

            ),
          ),
        ),

      ),
    );
  }
}
