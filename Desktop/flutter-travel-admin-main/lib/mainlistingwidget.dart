import 'package:flutter/material.dart';
import 'package:travel_admin/models/createlistingmodel.dart';
class MainListingWidget extends StatefulWidget {
  final CreateListingModel listingModel;
  const MainListingWidget({Key key, this.listingModel}) : super(key: key);

  @override
  _MainListingWidgetState createState() => _MainListingWidgetState();
}

class _MainListingWidgetState extends State<MainListingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(widget.listingModel.image.toString(),cacheHeight: 150,cacheWidth: 150,)),
          Text(widget.listingModel.description)
        ],
      ),
    );
  }
}

