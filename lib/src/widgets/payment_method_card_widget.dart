import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// ignore: must_be_immutable
class PaymentMethodCardWidget extends StatefulWidget {
  final onViewCardCallBack;
  bool isViewVisible;

  PaymentMethodCardWidget({Key? key,
    this.onViewCardCallBack,
    this.isViewVisible = false
  }) : super(key: key);

  @override
  State<PaymentMethodCardWidget> createState() => _PaymentMethodCardWidgetState();
}

class _PaymentMethodCardWidgetState extends State<PaymentMethodCardWidget> {
  int selectValue = 0;

  List<PaymentMethodList> payment = [
    PaymentMethodList(
      title: 'Credit/Debit Card',
      subtitle: "Ending in 1560",
      icon: 'assets/images/visa_icon.svg',
    ),
    PaymentMethodList(
      title: 'Bank Account',
      subtitle: "Ending in 9473",
      icon: 'assets/images/bank_icon.svg',
    ),
    PaymentMethodList(
      title: 'PayPal',
      subtitle: "my.paypal@gmail.com",
      icon: 'assets/images/paypal_icon.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;


    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 0,right: 0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: payment.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.grey.withOpacity(0.6),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: !isDarkMode ?Colors.grey.withOpacity(0.10):AppColors().appBgColor3,
              borderRadius: BorderRadius.circular(12),
              border:!isDarkMode ?
              Border.fromBorderSide(
                  BorderSide(width: 1.2,
                      color: selectValue ==index
                          ? appColors.buttonColor2
                          : Colors.transparent))
                  :Border.fromBorderSide(
                  BorderSide(width: 1.2,
                  color: selectValue ==index
                      ? Color(0xffE4B343)
                      : Colors.transparent))
            ),
            margin: EdgeInsets.symmetric(
                horizontal: 12, vertical: 7),
            child: Transform.scale(
              scale: 1.1,
              child: RadioListTile<int>(
                value: index,
                groupValue: selectValue,
                activeColor:!isDarkMode ? appColors.buttonColor2:Color(0xffE4B343),
                onChanged: (index) =>
                    setState(() => selectValue = index!),
                title: Text(payment[index].title,
                  style: TextStyle(
                      color: !isDarkMode ?Colors.black:Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),),
                subtitle: Text(payment[index].subtitle,
                  style: TextStyle(
                      color: !isDarkMode ?AppColors().textHeadingColor2:AppColors().textHeadingColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),),
                tileColor: AppColors().appBgColor3,
                contentPadding: EdgeInsets.only(
                    left: 35, right: 20, top: 5, bottom: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side:!isDarkMode ?
                    BorderSide(width: 1,
                        color: selectValue ==index
                            ? appColors.buttonColor2
                            : Colors.white):
                    BorderSide(width: 1,
                        color: selectValue ==index
                            ? Color(0xffE4B343)
                            : Colors.white)
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: iconApps.iconImage(
                    imageUrl:payment[index].icon,
                    iconSize: Size(38, 38)
                ),
              ),
            ),
          ),
        );
      }
      );

  }
}


class PaymentMethodList {
  final String title;
  final String subtitle;
  final String icon;

  PaymentMethodList( {
    required this.title,
    required this.icon,
    required this.subtitle,
  });
}
