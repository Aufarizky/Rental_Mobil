import 'package:flutter/material.dart';
import 'package:indocars/order.dart';
import 'Spesifik_Mobil.dart';

void _showSimpleDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Permintaan Terkirim",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}

class DetailMobil extends StatelessWidget {
  final String? title;
  final double? price;
  final String? color;
  final String? gearbox;
  final String? fuel;
  final String? brand;
  final String? path;

  DetailMobil(
      {this.title,
        this.price,
        this.color,
        this.gearbox,
        this.fuel,
        this.brand,
        this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("UMM Rental"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,
          ),
          ),
          Text(
            brand!,
            style: TextStyle(fontSize: 15,
            ),
          ),
          Hero(tag: title!, child: Image.asset(path!)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpesifikMobil(
                name: '1 hari',
                price: price! * 1,
                name2: 'Rupiah',
              ),
              SpesifikMobil(
                name: '2 hari',
                price: price! * 2,
                name2: 'Rupiah',
              ),
              SpesifikMobil(
                name: '3 hari',
                price: price! * 3,
                name2: 'Rupiah',
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'SPECIFICATIONS',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpesifikMobil(
                name: 'Color',
                name2: color!,
              ),
              SpesifikMobil(
                name: 'Gearbox',
                name2: gearbox!,
              ),
              SpesifikMobil(
                name: 'Fuel',
                name2: fuel!,
              )
            ],
          ),
          SizedBox(height: 10),
          RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Order(),));
            },
            padding: EdgeInsets.all(10.0),
            color: Colors.blueAccent,
            child: Text(
              'Rental',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}