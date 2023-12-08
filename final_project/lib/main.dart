import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './screens/signup.dart';
import './screens/signin.dart';
import './screens/home.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 FirebaseAuth _auth=FirebaseAuth.instance;
 @override
  void initState() {
   funac();
    super.initState();
  }

 funac()async{
Timer(const Duration(seconds: 3), () {
   if(_auth.currentUser==null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
    }else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      
    }
   
 });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset('assets/logo.png', height: 270.0, width: 250.0),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'title',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Spacer to push buttons to the bottom
            const Spacer(),

            // Orange Box with Buttons
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
              child: Container(
                color: Colors.orange,
                padding:const EdgeInsets.only(
                    top: 70.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 70.0,), // Adjust padding for top and bottom
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize:const Size(double.infinity,
                            50.0), // Set button width and height
                      ),
                      child:const Text('Sign Up'),
                    ),
                const    SizedBox(height: 16.0), // Spacer between buttons
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Change the button color
                        minimumSize:const Size(double.infinity,
                            50.0), // Set button width and height
                      ),
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
