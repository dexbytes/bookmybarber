import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';



class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, size.height /1.15) ;

    path.quadraticBezierTo(size.width/5, size.height-1, size.width/2, size.height-2) ;

    path.quadraticBezierTo(3/4 * size.width, size.height, size.width, size.height - 25) ;

    path.lineTo(size.width, 0) ;
    return path ;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CustomProfileAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, size.height /1.22) ;

    path.quadraticBezierTo(size.width/5, size.height-1, size.width/2, size.height-2) ;

    path.quadraticBezierTo(3/4 * size.width, size.height, size.width, size.height - 32) ;

    path.lineTo(size.width, 0) ;
    return path ;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CustomTutorialAppBar extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0,size.height /1.2) ;

    path.quadraticBezierTo(size.width/5, size.height-1, size.width/2, size.height-1) ;

    path.quadraticBezierTo(3/4 * size.width, size.height, size.width, size.height/1.2) ;

    path.lineTo(size.width, 0) ;
    return path ;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
