import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/geolocator/getPostion.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  GoogleMapController mapController;
  final searchController = TextEditingController();

  Widget titleAppBar = Text("Map Street View");
  Icon iconSearch= Icon(Icons.search, color: Colors.grey,);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  void geoLocation() async {
    getLocation().then((value) => mapController.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target: new LatLng(value.latitude, value.longitude),
            bearing: 0.0,
            zoom: 20.0))));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => geoLocation(),
          child: Icon(
            Icons.location_on_outlined,
            color: Colors.white,
          )),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: titleAppBar,
        actions: [
          IconButton(
            icon: iconSearch,
            onPressed: () {
              setState(() {
                 if(this.iconSearch.icon == Icons.search){
                   print("case 1 ----------");
                   iconSearch = Icon(Icons.cancel_outlined, color: Colors.grey,);
                   titleAppBar= TextField(
                     keyboardType: TextInputType.streetAddress,
                     decoration: InputDecoration(
                       hintText: 'Search address ...',
                         labelStyle: TextStyle(
                             fontFamily: 'Montserrat',
                             fontWeight: FontWeight.w300,
                             color: Colors.grey),
                         focusedBorder: UnderlineInputBorder(
                             borderSide:
                             BorderSide(color: Colors.white))),
                     controller: searchController,
                   );
                 }else{
                   print("case 2 ----------");
                   this.iconSearch = Icon(Icons.search, color: Colors.grey,);
                   this.titleAppBar= Text("Map Street View");
                 }
              });
            },
          )
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: new LatLng(31.524500, 34.442904),
          zoom: 14.0,
        ),
        buildingsEnabled: true,
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        trafficEnabled: true,
        mapToolbarEnabled: true,
        indoorViewEnabled: true,
      ),
    );
  }
}
