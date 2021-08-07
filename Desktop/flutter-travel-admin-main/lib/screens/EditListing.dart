import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_admin/providers/userprovider.dart';
import 'package:travel_admin/screens/pickLocation.dart';
import 'package:travel_admin/screens/registrationscreen.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:flutter/painting.dart';
class EditListing extends StatefulWidget {

  final String description;
  final List images;
  final String location;
  final int price;
  const EditListing({Key key,this.images,this.description,this.price,this.location}) : super(key: key);

  @override
  _EditListingState createState() => _EditListingState();
}

class _EditListingState extends State<EditListing> {
  List l = [];
  List delete = [];

  ImagePicker picker = ImagePicker();
  File _pickedImage;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Uuid uuid = Uuid();
  DefaultCacheManager manager  = DefaultCacheManager();
  bool load1 = true;
  bool load2 = true;
  bool load3 = false;
  bool load4 = false;
  String changedDescription = '';
  String changedLocation = '';
  String changedPrice = '';
  int price = 0;



  deleteImage({list}){
    FirebaseFirestore.instance.collection('Camps').doc('ykWqAMpHw2Hra4Bjarjf').update({

      "images":FieldValue.arrayRemove(list)
    });
  }










  FirebaseStorage storage = FirebaseStorage.instance;
 Future pickImage({String uid})async{
   await picker.getImage(source: ImageSource.gallery).then((result) => {

      _pickedImage = File(result.path),



    });
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Change Images'),
        onPressed: (){


          Reference reference = FirebaseStorage.instance.ref().child('images/').child(uuid.v4().toString());
          UploadTask task = reference.putFile(_pickedImage);
          task.whenComplete(() {
            reference.getDownloadURL().then((url){
              l.add(url);
              firestore.collection('Camps').doc('v1i0S3rg1YiIMY0v4dOC').update({
                "images":FieldValue.arrayUnion(l)
              });
            } );
          });



        },
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(

            children: [



              /*Row(
               children: [
                 GestureDetector(
                     onTap: (){
                       setState(() {
                         load1 = false;
                         delete.add(widget.images[0]);
                         deleteImage(list: delete);

                       });
                     },
                     child: load1==true?Container(child: Image.network(widget.images[0],cacheHeight: 100,cacheWidth: 100,),):Container(),

                 ),
                 GestureDetector(
                   onTap: (){
                     setState(() {
                       load2 = false;
                       delete.add(widget.images[1]);
                       deleteImage(list: delete);

                     });
                   },
                   child: load2==true?Container(child: Image.network(widget.images[0],cacheHeight: 100,cacheWidth: 100,),):Container(),

                 ),



               ],
              ),*/



             /* Expanded(
                child: GridView.builder(

                  itemCount: widget.images.length,





                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                 itemBuilder: (context,index){

                    return FocusedMenuHolder
                 (
                    menuWidth: MediaQuery.of(context).size.width*0.50,
                    blurSize: 5.0,
                    menuItemExtent: 45,
                    menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    duration: Duration(milliseconds: 100),
                    animateMenuItems: true,
                    blurBackgroundColor: Colors.black54,
                    bottomOffsetHeight: 100,
                    openWithTap: true,
                    menuItems: <FocusedMenuItem>[
                      FocusedMenuItem(title: Text("Open"),trailingIcon: Icon(Icons.open_in_new) ,onPressed: (){
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTwo()));
                      }),
                      FocusedMenuItem(title: Text("Share"),trailingIcon: Icon(Icons.share) ,onPressed: (){}),
                      FocusedMenuItem(title: Text("Favorite"),trailingIcon: Icon(Icons.favorite_border) ,onPressed: (){}),
                      FocusedMenuItem(title: Text("Delete",style: TextStyle(color: Colors.redAccent),),trailingIcon: Icon(Icons.delete,color: Colors.redAccent,) ,onPressed: (){

                        setState(() {





                          delete.add(widget.images[index]);
                          FirebaseFirestore.instance.collection('Camps').doc('ykWqAMpHw2Hra4Bjarjf').update({
                            "images":FieldValue.arrayRemove(delete)
                          });



                        });



                      }),
                    ],
                    onPressed: (){},
                    child: Card(
                      child: Column(
                        children: <Widget>[
                       Image.network( widget.images[index],cacheHeight: 280,cacheWidth: 280,)
                        ],
                      ),
                    ));
                 })
              )*/

              Padding(
                padding: EdgeInsets.only(top: 30),
                child: CarouselSlider.builder(
                  itemCount: widget.images.length,
                  itemBuilder: (BuildContext,int itemIndex,int PageViewIndex){
                    return  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          widget.images[itemIndex],fit: BoxFit.fitWidth,

                      ),
                    );
                  },
options: CarouselOptions(
  enlargeCenterPage: true,
  autoPlay: true
),
                ),
              ),

              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(



                      child: Row(children:[ Container(
                        height: 20,
                        width: 200,
                        child: TextFormField(decoration: InputDecoration(hintText: 'Change Description'),
                        onChanged: (value){
                          changedDescription = value;

                        },

                        ),
                      ),IconButton(icon: Icon(Icons.arrow_right,),onPressed: (){
                        FirebaseFirestore.instance.collection('Camps').doc('ykWqAMpHw2Hra4Bjarjf').update({
                          'description':changedDescription
                        });

                      },)]),
                    ),
                    Container(



                      child: Row(children:[ Container(
                        height: 20,
                        width: 200,
                        child: TextFormField(decoration: InputDecoration(hintText: 'Change Location'),
                          onChanged: (value){
                            changedLocation = value;

                          },

                        ),
                      ),IconButton(icon: Icon(Icons.arrow_right,),onPressed: (){
                        FirebaseFirestore.instance.collection('Camps').doc('ykWqAMpHw2Hra4Bjarjf').update({
                          'location':changedLocation
                        });

                      },)]),
                    ),
                    Container(



                      child: Row(children:[ Container(
                        height: 20,
                        width: 200,
                        child: TextFormField(decoration: InputDecoration(hintText: 'Change Price'),
                          onChanged: (value){

                          setState(() {
                            changedPrice = value ;
                            price = changedPrice as int;
                          });


                          },

                        ),
                      ),IconButton(icon: Icon(Icons.arrow_right,),onPressed: (){
                        FirebaseFirestore.instance.collection('Camps').doc('ykWqAMpHw2Hra4Bjarjf').update({
                          'price':changedPrice
                        });

                      },)]),
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
                      },
                    )


                  ],
                ),
              )




        ]))));
  }}

