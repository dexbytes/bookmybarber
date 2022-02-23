// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapIntegration extends StatefulWidget {
//   const MapIntegration({Key? key}) : super(key: key);
//
//   @override
//   _MapIntegrationState createState() => _MapIntegrationState();
// }
//
// class _MapIntegrationState extends State<MapIntegration> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   // static final CameraPosition _kLake = CameraPosition(
//   //     bearing: 192.8334901395799,
//   //     target: LatLng(37.43296265331129, -122.08832357078792),
//   //     tilt: 59.440717697143555,mkjfdz
//   //     zoom: 19.151926040649414);
//
//
//   //Move camera on
//
//   bool isMapLoading = true;
//   static double latitude = 37.51248996354304, longitude = 127.05270253797428;
//    LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
//    LatLng ? currentLocation;
//    GoogleMapController? mapController;
//
//
//   //Recenter my location
//   recenterMyLocation({bool fromInit = false}) {
//     try {
//       // searchController.text = '';
//       // mSearchedInputvalue = '';
//     } catch (e) {
//       print(e);
//     }
//     try {
//       // getPermission(onlyGetLocation: fromInit).then((value) {
//       //   if (value) {
//           // moveCameraToFirstStore(latitude, longitude, zoom: 16.0); //,zoom:16.0
//           Geolocator.getCurrentPosition(
//               desiredAccuracy: LocationAccuracy.medium)
//               .then((Position position) async {
//             if (position != null) {
//               if (position.latitude != latitude &&
//                   longitude != position.longitude) {
//                 latitude = position.latitude;
//                 longitude = position.longitude;
//                 if (mapController == null) {
//                   mapController =await  _controller.future;
//                 }
//                 mapController!.animateCamera(
//                     CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 16));
//
//               }
//               setState(() {
//
//               });
//             }
//           });
//       //   } else {
//       //     //getStationIndexes();
//       //   }
//       // });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   //
//   Future<void> ?  resetCameraOnCurrentLocation(
//       {isRecenterMap = false, bool fromInit = false}) {
//     //hideKeyboardOnTapCross(true);
//     if (isRecenterMap != null && isRecenterMap) {
//       try {
//         // getPermissionAwait().then((value) {
//         //   if (value) {
//         Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.medium)
//             .then((Position position) {
//           if (position != null) {
//             setState(() {
//               if (position.latitude != latitude &&
//                   longitude != position.longitude) {
//                 latitude = position.latitude;
//                 longitude = position.longitude;
//               }
//              // isCurrentLocationEnabled = true;
//               //rebuildAllChildren(context);
//               mapController!.animateCamera(
//                   CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 16));
//             });
//           }
//         });
//         // }
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
//
//   Future<void>? rebuildAllChildren(BuildContext context) {
//     void rebuild(Element el) {
//       el.markNeedsBuild();
//       el.visitChildren(rebuild);
//     }
//
//     (context as Element).visitChildren(rebuild);
//     return null;
//   }
//
//   _onMapCreated(GoogleMapController controller) {
//     // _controller.complete(controller);
//     if (!_controller.isCompleted) {
//       _controller.complete(controller);
//     }
//
//     if (isMapLoading) {
//       Future.delayed(Duration(milliseconds: 100), () => setState(() {
//             isMapLoading = false;
//             rebuildAllChildren(context);
//             recenterMyLocation(
//             //  isRecenterMap: true,
//                 fromInit: true);
//           }));
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(target: _initialCameraPosition, zoom: 16),
//         mapType: MapType.normal,
//         onMapCreated: _onMapCreated,
//         //myLocationEnabled: isCurrentLocationEnabled,
//         circles: Set.from(
//           [
//             Circle(
//               circleId: CircleId('currentCircle'),
//               center: currentLocation ?? _initialCameraPosition,
//               radius: 200,
//               fillColor: Colors.blue.shade100.withOpacity(0.5),
//               strokeColor: Colors.blue.shade100.withOpacity(0.1),
//             ),
//           ],
//         ),
//         zoomControlsEnabled: false,
//         // myLocationButtonEnabled: true,
//       ),/* GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: _kGooglePlex,
//         zoomControlsEnabled: true,
//         myLocationEnabled: true,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),*/
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: Text('To the lake!'),
//       //   icon: Icon(Icons.directions_boat),
//       // ),
//     );
//   }
//
//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
// }