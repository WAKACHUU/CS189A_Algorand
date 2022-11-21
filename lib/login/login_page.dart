// login Page
import 'package:untitled1/signup/signup.dart';
import 'package:flutter/material.dart';
// import 'HomePage.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'asset/images/algorand.png',
                  fit: BoxFit.fitHeight,
                  height: 64,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Algo-learn Learning Management-system')),
            ],

          ),
        backgroundColor: Color.fromARGB(255, 115, 179, 239),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/UCSB.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@ucsb.edu'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Color.fromARGB(255, 115, 179, 239), fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 115, 179, 239), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  // an event to be done
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account'),
            TextButton(onPressed: (
                //TODO SIGNUP SCREEN GOES HERE
                ) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpDemo()),
              );
            }, 
            child: Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 115, 179, 239), fontSize: 15),))
            
          ],
        ),
      ),
    );
  }
}