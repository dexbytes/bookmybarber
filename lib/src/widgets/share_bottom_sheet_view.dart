import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

import 'basic_view_container/container_first.dart';
import 'bottomsheet_card_view.dart';


class ShareBottomSheetScreen extends StatefulWidget {
  const ShareBottomSheetScreen({Key? key,

  }) : super(key: key);
  @override
  _ShareBottomSheetScreenState createState() => _ShareBottomSheetScreenState();
}

class _ShareBottomSheetScreenState extends State<ShareBottomSheetScreen> {




  List<ShareList> categories = [
    ShareList(
      title: 'Friends',
      icon: 'assets/images/contact_icon.png',
      colors: Color(0xff14D9D4),
    ),
    ShareList(
      title: 'Message',
      icon: 'assets/images/message_icon.png',
      colors: Color(0xff00FA9A),
    ),
    ShareList(
      title: 'Facebook',
      icon: 'assets/images/facebook_icon.svg',
      colors: Color(0xff4267B2),
    ),

    ShareList(
      title: 'Email',
      icon: 'assets/images/mail_icon.png',
      colors: Color(0xffCD5C5C),
    ),
    ShareList(
      title: 'Messenger',
      icon: 'assets/images/messenger_icon.png',
      colors: Color(0xff006AFF),
    ),
    ShareList(
      title: 'Pinterest',
      icon: 'assets/images/pinterest_icon.png',
      colors: Color(0xffB22222),
    ),

  ];


  @override
  Widget build(BuildContext context) {



    _welcomeTextView() {
      return Container(
          margin: EdgeInsets.only(left: 25),
          child: Text("Share to",

            // appString.trans(
            // context, appString.yourPromoCodes,

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ));
    }

    _dataView() {
      return Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
            border: Border(top: BorderSide(color: Colors.grey,width: 0.4,))
          ),
        margin: EdgeInsets.only(top: 15,),
        height: 240,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 20,right: 15,top: 20),
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length ,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  print("$index",);
                  // this.onClickCardCallBack?.call(0);

                },
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)
                      ),
                      color:categories[index].colors,
                      child: Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:Colors.transparent,
                          ),
                          child:Align(
                            alignment: Alignment.center,
                            child:iconApps.iconImage(
                                imageUrl:categories[index].icon,
                                imageColor: Colors.white,
                                iconSize: Size(32, 32)
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(categories[index].title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black)),
                  ],
                ),
              ),
            );
          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,         //for most popular item list count : 2  & for BrandCardView count :4
            mainAxisSpacing: 55,
            crossAxisSpacing: 20,//for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
            mainAxisExtent: 78
        ),
        )
      );
    }


    return BottomSheetOnlyCardView(
        sheetTitle: "Share to",
        sheetTitleStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
        topLineShow: false,

        bottomSheetHeight: MediaQuery.of(context).size.height/2.5,
        child:   Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _welcomeTextView(),

                _dataView()
              ],
            ),
          ],
        ),
    );

  }
}

class ShareList {
  final String title;
  final Color colors;
  final String icon;

  ShareList( {
    required this.title,
    required this.colors,
    required this.icon,
  });
}
