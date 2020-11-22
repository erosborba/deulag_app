import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class GetDrivers extends StatefulWidget {

//   @override
//   _GetDriversState createState() => _GetDriversState();
// }

// class _GetDriversState extends State<GetDrivers> {

//   @override
//   build(BuildContext context) async {
//     QuerySnapshot driver = await FirebaseFirestore.instance.collection('Pilotos').orderBy('pontos').get();
//     return FutureBuilder(

//     );
//   }
//}

class Drivers {
  getDrivers(String nome, int pontos) {
    return FirebaseFirestore.instance
        .collection('Pilotos')
        .orderBy('pontos')
        .get();
  }
}
