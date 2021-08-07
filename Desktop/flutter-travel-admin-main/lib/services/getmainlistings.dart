import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_admin/models/createlistingmodel.dart';
class GetMainListing{


  FirebaseFirestore firestore = FirebaseFirestore.instance;


 Future<List<CreateListingModel>> getMainListing()async{

     return  firestore.collection('createlisting').get().then((value){
      List<CreateListingModel> listings = [];

      for(DocumentSnapshot docs in value.docs){

        listings.add(CreateListingModel.fromSnapshot(docs));

      }
      return listings;


    }
    );
  }


}