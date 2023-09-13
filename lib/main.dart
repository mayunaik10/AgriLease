import 'package:agrilease/screens/email/login_page.dart';
import 'package:agrilease/screens/email/register_page.dart';
import 'package:agrilease/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:agrilease/screens/login_screen.dart';
//import 'package:agrilease/screens/phoneauth_screen.dart';
import 'package:agrilease/screens/phone/phone.dart';
import 'package:agrilease/screens/phone/verify.dart';
import 'package:agrilease/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      // after 3 seconds screen will move to next screen
      builder: (context, AsyncSnapshot snapshot){
        //show splash screen while waiting for app resources to load:
        if(snapshot.connectionState == ConnectionState.waiting){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen());
        }else{
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.orange,
                fontFamily: 'Horizon'
            ),
            home: LoginScreen(),
            routes: {
              //we will add the screens here for easy navigation
              LoginScreen.id: (context) => LoginScreen(),
              //PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
              'phone': (context) => MyPhone(),
              'verify': (context) => MyVerify(),
              'login': (context) => LoginPage(),
              'register': (context) => RegisterPage(),
              'home':(context)=>HomePage(),



            },
          );
        }
      },
    );
  }
}