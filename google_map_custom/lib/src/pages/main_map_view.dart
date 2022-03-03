import 'package:flutter/material.dart';
import 'package:google_map_custom/src/pages/map_data_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart'  as  addressLocation;

class MainMapView extends StatefulWidget {
  const MainMapView({Key? key}) : super(key: key);

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

  _coffeeShopList(index) {
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
            moveCamera();
          },
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(left: 0,right: 0),
              padding: EdgeInsets.zero,
              width: 260,
              height: 130,
              child: Material(
                color: Colors.transparent,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: NetworkImage(mapData[index].imageUrl),
                          fit: BoxFit.cover,
                          height:MediaQuery.of(context).size.height/10,
                          width:MediaQuery.of(context).size.height,
                        ),

                        // Image(image:AssetImage(home[index].imageUrl),
                        //   fit: BoxFit.cover,
                        //   height:MediaQuery.of(context).size.height/7,
                        //   width:MediaQuery.of(context).size.height /2,
                        // ),
                        /* Ink.image(image:AssetImage("assets/images/card_image.png",),
                  fit: BoxFit.cover,
                  height:MediaQuery.of(context).size.height/6,
                  width:MediaQuery.of(context).size.height /3,
                  ),*/
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
                                Text(mapData[index].title),
                                // Expanded(
                                //   child: Html(data: isSecondDataVisible ?home2[index].title :home[index].title,
                                //     style: {'html' : Style.fromTextStyle(
                                //         titleTextStyle
                                //     )},
                                //
                                //   ),
                                // ),
                                Icon(Icons.star)
                                // StarRatingBar(
                                //   removeViewCount: true,
                                // )
                              ],
                            ),
                            Text(mapData[index].subtitle),
                            // Html(data:isSecondDataVisible ?home2[index].subtitle :home[index].subtitle,
                            //   style: {'html' : Style.fromTextStyle(
                            //       subtitleTextStyle
                            //   )},
                            //
                            // ),
                          ],
                        ),
                      ),
                    ],
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
          bottom: 35.0,
          child: Container(
            height: 180.0,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: mapData.length,
              itemBuilder: (BuildContext context, int index) {
                return _coffeeShopList(index);
              },
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
    _location.onLocationChanged.listen((l) {
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
        };
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
