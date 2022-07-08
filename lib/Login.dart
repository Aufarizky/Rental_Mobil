import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:indocars/auth.dart';
import 'package:indocars/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const Route = '/login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  List<Map<String, dynamic>> dataUser = DummyData.data;
  void getdata() async {
    final prefs = await SharedPreferences.getInstance();
    int? currentid = prefs.getInt('id');
    for (var i = 0; i < dataUser.length; i++) {
      if (currentid != null && currentid == dataUser[i]['id']) {
        prefs.setString('nama', dataUser[i]['nama']);
        prefs.setString('nim', dataUser[i]['Nim']);
       
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState\
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Accounts',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: usernameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
                      hintText: 'Username',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextButton(
                      onPressed: () async {
                        AuthenticationService service = AuthenticationService(FirebaseAuth.instance);
                        final prefs = await SharedPreferences.getInstance();
                        service.signIn(email: usernameController.text, password: passwordController.text).then((value) {
                          if (value){
                            Navigator.pushReplacementNamed(context, "/page1");
                          }else {
                            
                        for (var i = 0; i < dataUser.length; i++) {
                          if (usernameController.text ==
                                  dataUser[i]['username'] &&
                              passwordController.text ==
                                  dataUser[i]['password']) {
                            prefs.setInt('id', dataUser[i]['id']);
                            prefs.setString('nama', dataUser[i]['nama']);
                            prefs.setString('nim', dataUser[i]['Nim']);
                            Navigator.pushReplacementNamed(context, '/page1');
                          }
                        }
                          }
                        });
                        
                      },
                      child: const Text(
                        'Log In',
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          backgroundColor: Color.fromARGB(255, 44, 89, 238),
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 20,),
                InkWell(onTap: (() {
                  Navigator.pushNamed(context, "/register");
                }),child: Text("Belum punya akun? Silahkan Register"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}