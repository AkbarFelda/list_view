import 'package:flutter/material.dart';
import 'package:list_movie/Homepage.dart';
import 'package:list_movie/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget login(String label, bool isObsecure){
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Center(
        child: Container(
          child: Column(
            children: [
              //Textfield username
              login("Username", false),
              //Textfield password
              login("Password", true),
              SizedBox(height: 16), // Tambahkan jarak di antara tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Elevated Button
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const HomePage()),
                    );
                  }, child: Text ('Login')),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.black), // Gunakan style yang sama
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
