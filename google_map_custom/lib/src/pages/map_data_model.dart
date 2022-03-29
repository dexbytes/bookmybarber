// ignore_for_file: prefer_const_constructors

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRawData {
  final String title;
  final String subtitle;
  final String imageUrl;
  LatLng locationCoords;

  MapRawData(
      {
        required this.title,
        required this.subtitle,
        required  this.imageUrl,
        required  this.locationCoords
      });
}

final List<MapRawData> mapData = [
  MapRawData(
      title: "RedBox Barber",
      subtitle: "288 McClure Court, Arkansas",
      locationCoords: LatLng(22.758940, 75.891418),
      imageUrl:"https://t4.ftcdn.net/jpg/03/70/54/57/360_F_370545759_BB79gT7Uw9kdvy9TBIrQsEDnNwr56H38.jpg"
  ),
  MapRawData(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      locationCoords:  LatLng(22.758440, 75.841418),
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSthQUeWFo_SU59tLgllRxMCrGpQYKaw2nWHw&usqp=CAU"
  ),
  MapRawData(
      title: 'Beauty Plus Spa',
      subtitle: "288 McClure Court, Arkansas",
      locationCoords: LatLng(22.754440, 75.841418),
      imageUrl: "https://northernvirginiamag.com/wp-content/uploads/2018/12/hair-stylist.jpg"
  ),
  MapRawData(
      title: 'Gold Comb.',
      subtitle: "288 McClure Court, Arkansas",
      locationCoords: LatLng(22.734440, 75.841418),
      imageUrl: "https://t4.ftcdn.net/jpg/03/70/54/57/360_F_370545759_BB79gT7Uw9kdvy9TBIrQsEDnNwr56H38.jpg"
  ),
  MapRawData(
      title: "Get Buzzed Barber",
      subtitle: "288 McClure Court, Arkansas",
      locationCoords: LatLng(22.784440, 75.811418),
      imageUrl: "https://northernvirginiamag.com/wp-content/uploads/2018/12/hair-stylist.jpg"
  )
];