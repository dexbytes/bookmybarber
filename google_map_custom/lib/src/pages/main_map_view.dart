// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_map_custom/src/pages/map_data_model.dart';
import 'package:google_map_custom/src/widgets/star_rating_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart'  as  addressLocation;

class MainMapView extends StatefulWidget {
  final Widget? child;
  final floatingButtonClickCallBack;
  const MainMapView({Key? key, this.child, this.floatingButtonClickCallBack}) : super(key: key);

  @override
  _MainMapViewState createState() => _MainMapViewState();
}

class _MainMapViewState extends State<MainMapView> {
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  final Permission _permission = Permission.location;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
  GoogleMapController? _controller;
  addressLocation.Location _location = addressLocation.Location();

  //Check permission
  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
    performPermissionAction();
  }

  //Request for the permission
  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() => _permissionStatus = status);
    _listenForPermissionStatus();
  }

  //Perform action according to permission status
  performPermissionAction() {
    switch (_permissionStatus) {

    //If permission denied then then again ask/request for the permission
      case PermissionStatus.denied:
        requestPermission(_permission);
        break;

    //If permission granted then get current location
      case PermissionStatus.granted:
        print('debug: Permission Granted');
        break;


      case PermissionStatus.limited:
        break;
      default:
        return Colors.grey;
    }
  }

  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/markers_icon.png');
  }



  List<Marker> allMarkers = [];
  final PageController _pageController = PageController(initialPage: 0,viewportFraction: 0.8);

  int prevPage = 0;


  // void setCustomMarker() async{
  //     await BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/markers_icon.png').then((value){
  //     coffeeShops.forEach((element) {
  //       allMarkers.add(Marker(
  //           markerId: MarkerId(element.title),
  //           draggable: false,
  //           icon: value,
  //           infoWindow:
  //           InfoWindow(title: element.title, snippet: element.subtitle),
  //           position: element.locationCoords));
  //     });
  //     setState(() {
  //
  //     });
  //   });
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMarker();
    mapData.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.title),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.title, snippet: element.subtitle),
          position: element.locationCoords));
    });
    _pageController
        .addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page?.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  _barberShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (
          BuildContext context,widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = index + _pageController.page;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return SizedBox(
          height: Curves.easeInOut.transform(value) * 125.0,
          width: Curves.easeInOut.transform(value) * 350.0,
          child: widget,
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child:widget.child ??
              Stack(children: [
                Container(
                margin: EdgeInsets.only(left: 12),
                padding: EdgeInsets.zero,
                height: 180,
                width: 320,
                child: Material(
                  color: Colors.transparent,
                  child: Card(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    child: InkWell(
                      onTap: (){
                        // this.onCardClickCallBack?.call();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: mapData[index].imageUrl,
                                fit: BoxFit.cover,
                                height:MediaQuery.of(context).size.height/8.5,
                                width:MediaQuery.of(context).size.height /2,
                              )
                          ),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Html(data:mapData[index].title,
                                        style: {'html' : Style.fromTextStyle(
                                          TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black,height: 0.5),
                                        )},

                                      ),
                                    ),
                                    StarRatingBar(
                                      removeViewCount: true,
                                    )
                                  ],
                                ),
                                Html(data:mapData[index].subtitle,
                                  style: {'html' : Style.fromTextStyle(
                                    TextStyle(fontSize: 13.5,fontWeight: FontWeight.w400,color: Colors.grey,height: 0.3),
                                  )},

                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(10))
                                  ),
                                  child: Text("Book",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,color: Colors.black),),
                                  height: 28,
                                  width: 70,
                                )
                              ],),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 50.0,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(22.758940, 75.891418), zoom: 14.0),
            markers: Set.from(allMarkers),
            onMapCreated: _onMapCreated,

          ),
        ),
        Positioned(
          bottom: 55.0,
          child: Container(
            height: 210.0,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: mapData.length,
              itemBuilder: (BuildContext context, int index) {
                return _barberShopList(index);
              },
            ),
          ),
        ),
    Positioned(
       bottom: MediaQuery.of(context).size.height /10.5,
       right: 15,
         child: Theme(
              data: Theme.of(context).copyWith(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
              sizeConstraints: BoxConstraints.tightFor(width: 55,height: 55),
          )),
         child: Padding(
         padding: EdgeInsets.only(bottom: 10.0),
         child: FloatingActionButton(
         elevation: 0,
         onPressed: (){
           widget.floatingButtonClickCallBack.call();
         },
         backgroundColor: Color(0xffFE457C),
         child: Container(
         alignment: Alignment.center,
         child:Icon(Icons.format_list_bulleted_rounded,size: 36,color: Colors.white,)
        )
      ),
      ),
      ),
    )
      ],
    );
  }

  // void mapCreated(controller) {
  //   setState(() {
  //     _controller = controller;
  //   });
  // }

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l)  {
     setState(() {
        _markers.add(
            Marker(markerId: MarkerId("id-1"),
                position:LatLng(l.latitude??20.5937, l.longitude??78.9629),
                icon: mapMarker,
                infoWindow: InfoWindow(
                    title: "$_location",
                    snippet: "Current Location"
                )
            )
        );

        if (mapData.length == 0) {
          _controller!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(l.latitude??20.5937, l.longitude??78.9629),zoom: 15),
            ),
          );
        }
      });

    });
  }


  moveCamera() {
    _controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: mapData[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
