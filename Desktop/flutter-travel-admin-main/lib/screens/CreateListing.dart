import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_admin/mainlistingwidget.dart';
import 'package:travel_admin/providers/listingprovider.dart';
import 'package:travel_admin/providers/userprovider.dart';
import 'package:travel_admin/screens/createlisting/createHomeStayListing.dart';
class CreateListing extends StatefulWidget {
  const CreateListing({Key key}) : super(key: key);

  @override
  _CreateListingState createState() => _CreateListingState();
}

class _CreateListingState extends State<CreateListing> {
  @override
  Widget build(BuildContext context) {
    final mainlistingProvider = Provider.of<ListingProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(top: 20,left: 10),
          child: Container(
            height: 400,
            width: 500,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
                return GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateHomeStay(collectionName: mainlistingProvider.mainlistinglist[index].description,)));
                    },


                    child: MainListingWidget(listingModel: mainlistingProvider.mainlistinglist[index],));
              },
              itemCount: mainlistingProvider.mainlistinglist.length,
            ),
          ),
        ),
      ),
    );
  }
}
