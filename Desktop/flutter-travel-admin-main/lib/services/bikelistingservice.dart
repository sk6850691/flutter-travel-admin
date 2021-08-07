import 'package:cloud_firestore/cloud_firestore.dart';

class BikeListing{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collections = "bikes";


  createbikelisting({String location,String bikename,String price,String seatingcapacity,String uid}){

    firestore.collection(collections).doc(uid).set({

      "location": location,
      "name": bikename,
      "price":price,
      "seating capacity": seatingcapacity


    });
  }


}