import 'package:flutter/material.dart';
import 'package:kelompokmbl/data/color.dart';
import 'package:kelompokmbl/screen/navbarscreen.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              // Center(
              //   child: Container(
              //     child: Image.asset('assets/ilustration-login.png'),
              //   ),
              // ),
              Center(
                child: Container(
                  child: Image.asset('assets/loginscrenn.jpg'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _inputEmail,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _inputEmail,
                  obscureText: mounted,
                  decoration: InputDecoration(  
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                  child: ListTile(
                leading: Text('Remember me'),
                trailing: Text(
                  'Needs Help',
                  style: TextStyle(
                      color: MyColor.primaryColor, fontWeight: FontWeight.bold),
                ),
              )),
              Container(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavbarScreen()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: MyColor.primaryColor),
                    )),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(child: Text('Create An Account?')))
            ],
          ),
        ),
      ),
    );
  }
}
