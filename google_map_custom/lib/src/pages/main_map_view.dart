import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart'  as  addressLocation;

class MainMapView extends StatefulWidget {
  const MainMapView({Key? key}) : super(key: key);

  @override
  _MainMapViewState createState() => _MainMapViewState();
}

class _MainMapViewState extends State<MainMapView> {
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

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
     if (mounted) {
       setState(() {
              _controller!.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: LatLng(l.latitude??20.5937, l.longitude??78.9629),zoom: 15),
                ),
              );
            });
     }
    });
  }

  @override
  void initState() {
    //First we need to check permission of location
    _listenForPermissionStatus();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: _initialCameraPosition),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
        ),
      );

  }
}
