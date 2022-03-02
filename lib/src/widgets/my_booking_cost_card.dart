import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:flutter/material.dart';


class BookingDetailCostCardView extends StatelessWidget {
  final double serviceCost;
  final double tax;
  final double couponsDiscount;
  final Color? cardColor;
  const BookingDetailCostCardView({Key? key,
    this.serviceCost = 750,
    this.tax = 50,
    this.couponsDiscount = 50,
    this.cardColor,


  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 15,left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: cardColor?? AppColors().appBgColor3,

      ),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Services Charge",style:TextStyle(fontSize:13,fontWeight: FontWeight.w400,color: Colors.white)),
                Text("\$$serviceCost",style:TextStyle(fontSize:13,fontWeight: FontWeight.w400,color: Colors.white),),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax",style:TextStyle(fontSize:13,fontWeight: FontWeight.w400,color:  Colors.white),),
                Text("\$$tax",style:TextStyle(fontSize:13,fontWeight: FontWeight.w400,color: Colors.white),textAlign: TextAlign.start,),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey,width: 0.3,))),
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coupon Discount",style:TextStyle(fontSize:13,fontWeight: FontWeight.w400,color: Colors.white),),
                Text("\$$couponsDiscount",style:TextStyle(fontSize:13,fontWeight: FontWeight.w400,color: Colors.red),textAlign: TextAlign.start,),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style:TextStyle(fontSize:15,fontWeight: FontWeight.w600,color: Colors.white),textAlign: TextAlign.start,),
                Text("\$${(serviceCost)+(tax)-(couponsDiscount)}",style:TextStyle(fontSize:15,fontWeight: FontWeight.w500,color: Colors.green),textAlign: TextAlign.start,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}