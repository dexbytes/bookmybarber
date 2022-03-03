import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BookingDetailServicesCardView extends StatelessWidget {
  final double serviceCost;
  final Color? cardColor;

   BookingDetailServicesCardView({Key? key,
    this.serviceCost = 750,
    this.cardColor,
  }) : super(key: key);


  List<BookingServicesList> service = [
    BookingServicesList(
      serviceName: 'Hair Service',
      cost: 250,
    ),
      BookingServicesList(
      serviceName: 'Hair Spa',
      cost: 150,
    ),
    //   BookingServicesList(
    //   serviceName: 'Hair Cutting',
    //   cost: 250,
    // ),
    //   BookingServicesList(
    //   serviceName: 'Hair Coloring',
    //   cost: 250,
    // ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20 ,right: 20,top: 12,bottom: 5),
      margin: EdgeInsets.only(right: 15,left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: cardColor?? AppColors().appBgColor3,

      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        itemCount: service.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(service[index].serviceName, style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
            Text("\$${service[index].cost}", style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white),),
          ],
        ),
      );
    }
    ),
    );
  }
}

class BookingServicesList {
  final String serviceName;
  final double cost;


  BookingServicesList({
    required this.serviceName,
    required this.cost,
  });
}