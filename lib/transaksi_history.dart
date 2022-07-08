import 'package:flutter/material.dart';
import 'package:indocars/services/order_services.dart';
import 'package:indocars/style/colors.dart';
import 'package:indocars/transaksi_bar.dart';
import 'package:indocars/transaksi_card.dart';
import 'package:provider/provider.dart';

import '../transaksi_bar.dart';

class TransasksiHistory extends StatefulWidget {
  const TransasksiHistory({Key? key}) : super(key: key);

  @override
  State<TransasksiHistory> createState() => _TransasksiHistoryState();
}

class _TransasksiHistoryState extends State<TransasksiHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: MyColors.whiteSoft,
        child: Column(children: [
          TransaksiBar(),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: const BoxDecoration(
                  color: MyColors.whiteSoft,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child:
                        Consumer<OrderService>(builder: ((context, order, child) {
                      List<Map<String, dynamic>> items = order.transaksi;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 210,
                        child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: ((context, i) {
                              Map<String, dynamic> vehicle = items[i]['vehicle'];
                              String totalHarga =
                                  (vehicle['harga'] * vehicle['total'] )
                                      .toString();
                              return GestureDetector(
                                onTap: () {
                                  order.selectedIndex = i;
                                  Navigator.pushNamed(
                                      context, '/transaksidetail');
                                  print(i);
                                },
                                child: TransaksiCard(
                                    vehicle['type'],
                                    'harian',
                                    vehicle['total'].toString(),
                                    totalHarga,
                                    items[i]['status'],
                                    order.img['mobil1']!,
                                    () {}),
                              );
                            })),
                      );
                    }))),
              ),
            ),
          )
        ]),
      )),
    );
  }
}