import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:indocars/auth.dart';
import 'package:indocars/main.dart';

class MyProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('My Profil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            child: Stack(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(image: AssetImage('images/assets/images.png'),
                      fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text('${user1.email}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, right: 50, left: 50),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.home, color: Colors.grey, size: 58),
                          Text('Malang', style: TextStyle(color: Colors.black45,
                          fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.phone_android, color: Colors.grey, size: 58),
                            Text('Phone', style: TextStyle(color: Colors.black45,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(height: 30,),
                InkWell(onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.popAndPushNamed(context, "/login");
                },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout')
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
