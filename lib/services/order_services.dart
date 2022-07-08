import 'package:flutter/foundation.dart';

class OrderService extends ChangeNotifier {

  int? selectedIndex = 1;
  String? selectedVehicle = 'mobil';

  List<Map<String, dynamic>> vehicle = [
    {'type': 'mobil1', 'harga': 250000},
    {'type': 'mobil2', 'harga': 250000},
    {'type': 'mobil3', 'harga': 250000},
    {'type': 'mobil4', 'harga': 250000},
    {'type': 'mobil5', 'harga': 250000},
    {'type': 'mobil6', 'harga': 250000},
  ];

  Map<String, dynamic> vehicleHarga = {
    'mobil1': 250000,
    'mobil2': 250000,
    'mobil3': 250000,
    'mobil4': 250000,
    'mobil5': 250000,
    'mobil6': 250000,
  };

  Map<String, String> img= {
  "mobil1": "images/assets/car1.jpg",
  "mobil2": "images/assets/car2.jpg",
  "mobil3": "images/assets/car3.jpg",
  "mobil4": "images/assets/car4.jpg",
  "mobil5": "images/assets/car5.jpg",
  "mobil6": "images/assets/car6.jpg",
};

  List<Map<String, dynamic>> transaksi = [
{
  'id' : 1,
  'status' : "Progres",
  'vehicle' : {'type': 'mobil', 'harga' : 250000, 'total': 1},
  'Waktu Sewa' : "1 hari",
},

{
  'id' : 2,
  'status' : "Progres",
  'vehicle' : {'type': 'mobil', 'harga' : 500000, 'total': 1},
  'Waktu Sewa' : "2 hari",
},

{
  'id' : 3,
  'status' : "Progres",
  'vehicle' : {'type': 'mobil', 'harga' : 750000, 'total': 1},
  'Waktu Sewa' : "3 hari",
},

{
  'id' : 4,
  'status' : "Progres",
  'vehicle' : {'type': 'mobil', 'harga' : 1000000, 'total': 1},
  'Waktu Sewa' : "4 hari",
},
  ];

  Map<String, dynamic> aTransaksi = {
    'id': 0,
    'status': "progress",
    'vehicle': {'type': 'mobil1', 'harga': 250000, 'total': 1},
    'wash': {'type': '1 hari', 'harga': 0},
    'add': [
      {'': 0}
    ],
  };

void createTransaksi() {
    aTransaksi['id'] = transaksi.length + 1;
    transaksi.add(aTransaksi);
    notifyListeners();
  }

  void updateStastusTransaksi(int index, String status) {
    transaksi[index]['status'] = status;
    notifyListeners();
  }

  void deleteTransaksi(int index) {
    transaksi.removeAt(index);
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  void saveTransasksiToLocal() {}

  double updateTotalHarga(String vehicle, List<String> add) {
    double total = 0;

    switch (vehicle) {
      case 'mobil':
    }
    notifyListeners();
    return total;
  }

  void resetATransaksi() {
    aTransaksi = {
      'id': 0,
      'status': "progress",
      'vehicle': {'type': '', 'harga': 0, 'total': 0},
      'wash': {'type': '1 hari', 'harga': 0},
      'add': [
        {'': 0}
      ],
    };
    notifyListeners();
  }

  int getHarga() {
    return (aTransaksi['vehicle']['total'] * aTransaksi['vehicle']['harga'] +
        aTransaksi['wash']['harga']);
  }
}