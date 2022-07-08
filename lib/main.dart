import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indocars/notif.dart';
import 'package:indocars/order.dart';
import 'package:indocars/register.dart';
import 'package:indocars/services/order_services.dart';
import 'package:indocars/transaksi_detail.dart';
import 'package:indocars/transaksi_history.dart';
import 'package:provider/provider.dart';
import 'Login.dart';
import 'MyProfil.dart';
import 'Tampilan_mobil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeNotif();

  runApp(
    ChangeNotifierProvider<OrderService>(
      create: (_) => OrderService(),
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
        home: new Login(),
        routes: <String, WidgetBuilder>{
          '/page1': (BuildContext context) => new Home(),
          '/login': (BuildContext context) => new Login(),
          '/register': (BuildContext context) => new register(),
          '/page2': (BuildContext context) => new MyProfil(),
          '/page3': (BuildContext context) => new Tampilanmobil(),
          '/order': (BuildContext context) => new Order(),
          '/transaksi': (BuildContext context) => new TransasksiHistory(),
          '/transaksidetail': (BuildContext context) => new DetailTransaksi(),
        },
      ),
    ),
  );
}

class Home extends StatelessWidget {
  String teks = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('UMM Rental'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Container(
              child: Image.asset(
                'images/gotrav.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(50.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                      hintText: 'Masukan Lokasi Anda Sekarang',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (context) => Tampilanmobil(),
                  );
                  Navigator.of(context).push(route);
                },
                padding: EdgeInsets.all(10.0),
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
