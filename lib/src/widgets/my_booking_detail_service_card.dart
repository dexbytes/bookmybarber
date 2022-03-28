import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/pages/book_appointment_screen.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


// ignore: must_be_immutable
class BookingDetailServicesCardView extends StatefulWidget {
  final Color? cardColor;
  final String? serviceName;
  final double? cost;

   BookingDetailServicesCardView({Key? key,
    this.cardColor, this.serviceName, this.cost,
  }) : super(key: key);

  @override
  State<BookingDetailServicesCardView> createState() => _BookingDetailServicesCardViewState();
}

class _BookingDetailServicesCardViewState extends State<BookingDetailServicesCardView> {
  List<BookingServicesList> service = [
    BookingServicesList(
      serviceName: 'Hair Service',
      cost: 25,
    ),
      BookingServicesList(
      serviceName: 'Hair Spa',
      cost: 20,
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
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      children: [
        SeeAllTextRow(
          leftTitle: "Services",
          leftTitleTextStyle: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w500,
              color:!isDarkMode ?Colors.black:Colors.white),
          rightTitle:service.length == 0 ? "Select Service":"Change Service",
          rightTitleTextStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Color(0xFFCCA76A)),
          rightTextCallBack: (){
            Navigator.push(
              context,
              BottomUpTransition(
                  widget: BookAppointmentScreen(isBottomButtonText: false,)),
            ).then((selectedServices){
              if(selectedServices != null){
                service.add(BookingServicesList( serviceName: selectedServices[0].title, cost: 25));
                setState(() {

                });
              }
            });
          },
        ),
        SizedBox(height: 8,),
        Container(
          padding: service.length == 0 ? EdgeInsets.zero:EdgeInsets.only(left: 20 ,right: 20,top: 12,bottom: 5),
          margin:  service.length == 0 ? EdgeInsets.zero:EdgeInsets.only(right: 15,left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: !isDarkMode ?Colors.grey.withOpacity(0.10):AppColors().appBgColor3,
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
                Text(widget.serviceName ??service[index].serviceName,
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:!isDarkMode ?Colors.black:Colors.white)),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      service.removeAt(index);
                    });
                  },
                  child: Row(
                    children: [
                      Text("\$${widget.cost ?? service[index].cost}", style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: !isDarkMode ?Colors.black:Colors.white),),
                      SizedBox(width: 5,),
                      Icon(Icons.cancel_outlined,size: 19,color: Colors.grey.withOpacity(0.6),),
                    ],
                  ),
                ),

              ],
            ),
          );
        }
        ),
        ),
      ],
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