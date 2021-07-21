import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel{

  static const  ID = "id";
  static const  PRICE = "price";
  static const  Guests = "guests";
  static const DATETIME =  "datetime";

  String _id;
  String _price;
  String _guests;
  DateTime _dateTime;





  BookingModel.fromSnapshot(DocumentSnapshot snapshot){

    _price = snapshot.data()[PRICE];
    _dateTime = snapshot.data()[DATETIME];
    _guests = snapshot.data()[Guests];
    _id = snapshot.data()[ID];




  }


}