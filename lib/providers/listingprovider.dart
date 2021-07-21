import 'package:flutter/cupertino.dart';
import 'package:travel_admin/services/bikelistingservice.dart';

class ListingProvider with ChangeNotifier{

  BikeListing listing = BikeListing();

  ListingProvider.initialize(){}



  TextEditingController locationcontroller = TextEditingController();
  TextEditingController bikenamecontroller = TextEditingController();
  TextEditingController pricecontroller= TextEditingController();

  TextEditingController seatingcapacitycontroller = TextEditingController();


  createbikelisting ({String uid}){
    listing.createbikelisting(location: locationcontroller.text,bikename: bikenamecontroller.text,price: pricecontroller.text,seatingcapacity: seatingcapacitycontroller.text,uid: uid);

  }




}