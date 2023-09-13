//import 'package:agrilease/screens/phoneauth_screen.dart';
import 'package:agrilease/screens/email/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:agrilease/screens/phone/phone.dart';

class LoginScreen extends StatelessWidget{
  static const String id = 'login-screen';
  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: Colors.orange
        ,
       body: Column(
         children: [
           Expanded(child:Container(
             width: MediaQuery.of(context).size.width,//to get device width
             color: Colors.white,
             child: Column(
               children: [
                 SizedBox(height: 100,),
                 Image.asset(
                   'assets/images/agriculture.jpg',
                   width: 150,
                   height: 150,),
                 SizedBox(height: 10,),
                 Text('AgriLease',style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   fontFamily: 'Comic',
                   color: Colors.black87,
                 ),)
               ],
             ),
           ),),
           Expanded(
             child: Container(
              child: AuthUi(),
           ),),

         ],
       )
      );
  }
}



class AuthUi extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                ),
                onPressed: (){
                  //Navigator.pushNamed(context, PhoneAuthScreen.id);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyPhone()),
                    );
                }, child: Row(
              children: [
                Icon(Icons.phone_android_outlined ,color: Colors.black,),
                SizedBox(width: 8,),
                Text('Continue with Phone',style: TextStyle(color: Colors.black)),
              ],
            )),
          ),

          SignInButton(
            Buttons.Google,
            text: "Continue with Google",
            onPressed: () {},
          ),
          

          Text('OR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

          SizedBox(
            width: 220,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54)
                ),
                onPressed: (){
                  //Navigator.pushNamed(context, PhoneAuthScreen.id);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()),
                  );
                }, child: Row(
              children: [
                Icon(Icons.phone_android_outlined ,color: Colors.white,),
                SizedBox(width: 8,),
                Text('Login with email',style: TextStyle(color: Colors.white)),
              ],
            )),
          ),

        ],
      ) ,
    );
  }
}

