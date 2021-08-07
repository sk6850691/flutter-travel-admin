import 'package:flutter/cupertino.dart';
import 'package:travel_admin/models/createlistingmodel.dart';
import 'package:travel_admin/services/bikelistingservice.dart';
import 'package:travel_admin/services/getmainlistings.dart';

class ListingProvider with ChangeNotifier{

  BikeListing listing = BikeListing();
  GetMainListing mainlisting = GetMainListing();
  List<CreateListingModel> mainlistinglist = [];

  ListingProvider.initialize(){

    getmainlisting();
  }



  TextEditingController locationcontroller = TextEditingController();
  TextEditingController bikenamecontroller = TextEditingController();
  TextEditingController pricecontroller= TextEditingController();

  TextEditingController seatingcapacitycontroller = TextEditingController();


  createbikelisting ({String uid}){
    listing.createbikelisting(location: locationcontroller.text,bikename: bikenamecontroller.text,price: pricecontroller.text,seatingcapacity: seatingcapacitycontroller.text,uid: uid);

  }

  getmainlisting()async{

    mainlistinglist = await mainlisting.getMainListing();
    notifyListeners();


  }




}