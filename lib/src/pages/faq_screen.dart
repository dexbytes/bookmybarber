import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/model/faq_data_model.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FaqScreen extends StatefulWidget {
  final String userName;
  final String profileImgUrl;
  final Function(dynamic)? onImageCallBack;

  const FaqScreen({ Key ?key,
    this.userName = "Mohit Panchal",
    this.profileImgUrl = "https://static.toiimg.com/thumb/msid-86203836,imgsize-29194,width-800,height-600,resizemode-75/86203836.jpg",
    this.onImageCallBack
  }) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {


  int selectedIndex = -1;
  int selectedIndex2 = -1;//dont set it to 0

  bool isExpanded = false;
  List drawerlist = [];

  prepareDrawerMenu(){

    List drawerSubMenuList = [];
    List drawerSubMenuChildList = [];

    drawerSubMenuList.add(DrawerSubMenu(title: "Book My Barber is an Appointment Booking App"
        " specifically made for Independent Barbers to effectively"
        " manage every aspect of their business with relative ease."));
    drawerlist.add(DrawerMenu(title: 'What is Book My Barber?', menuSubList: drawerSubMenuList));



    drawerSubMenuChildList.clear();
    drawerSubMenuList.clear();
    drawerSubMenuList.add(DrawerSubMenu(title: "The app is tailored to suit the management needs of each and every "
        "Independent Barber. This includes, but not limited to Barber, Hair Stylist, Esthetician, Makeup Artist,"
        " Skincare Specialist, Nail Artist, Hairdresser, Fashion Designer, Barber, Tattoo Artist, Masseuse, Image."
      ));
    drawerlist.add(DrawerMenu(title: 'What type of businesses can I manage with Book My Barber?', menuSubList: drawerSubMenuList));






    drawerSubMenuChildList.clear();
    drawerSubMenuList.clear();
    drawerSubMenuList.add(DrawerSubMenu(title:"The software solution can be used to manage virtually all "
        "areas of your barber business. These include; your client base, appointments, services, confirmations,"
        " reminders, daily schedule, special offers, referrals, calendar sync and lots more!"));
    drawerlist.add(DrawerMenu(title: 'What aspects of my business can be managed by Book My Barber?', menuSubList: drawerSubMenuList));


    drawerSubMenuChildList.clear();
    drawerSubMenuList.clear();
    drawerSubMenuList.add(DrawerSubMenu(title: "The software solution provides both Barber and "
        "their clients with a wide array of benefits. These includes easy scheduling, ability to "
        "send friendly automatic reminders to help reduce no-shows, "
        "gain total control over services and pricing, staying organized and professional. ",));
    drawerlist.add(DrawerMenu(title: 'What are the benefits of using Book My Barber?', menuSubList: drawerSubMenuList));

  }


  @override
  void initState() {
    prepareDrawerMenu();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ContainerFirst(
      appBackgroundColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      reverse: false,
      contextCurrentView: context,
      bottomBarSafeAreaColor: !isDarkMode ?Colors.white:AppColors().appBgColor2,
      statusBarColor:!isDarkMode ?Colors.white:AppColors().appBgColor2,
      // scrollPadding: EdgeInsets.only(bottom: 0),
      /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
      isSingleChildScrollViewNeed: true,
      isFixedDeviceHeight: true,
      appBarHeight: 60,
      appBar: Container(
        // color:!isDarkMode ?Colors.white:AppColors().appBgColor2,
        child: appBarWithBackArrow(
            isTitleVisible: true,
            isTrailingIconVisible: false,
            title: "Help & Support",
            textStyle: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: !isDarkMode?  AppColors().black:AppColors().textHeadingColor1,
            ),
            leadingIconColor:!isDarkMode?AppColors().buttonColor3:AppColors().buttonColor,
            leadingPadding: EdgeInsets.only(left: 10.0,bottom: 8,top: 0,right: 15),
            onPress: (){
              Navigator.pop(context);
            }
        ),
      ),
      containChild: Container(
        child: Stack(
          children: [
            Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  blackIconTiles(),
                ]
            ),
          ],
        ),
      ),
    );
  }


  Widget blackIconTiles(){
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.zero,
      margin:EdgeInsets.zero,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                itemCount: drawerlist.length,
                itemBuilder: (BuildContext context, int index) {
                  DrawerMenu menu = drawerlist[index];
                  bool selected = selectedIndex == index;
                  return Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    // decoration: BoxDecoration(
                    //     border: Border(bottom: BorderSide(color: Colors.grey,width: 0.15))
                    // ),
                    child: ExpansionTile(
                        onExpansionChanged:(z){
                          setState(() {
                            selectedIndex = z?index:-1;
                            print("$index");
                            menu.menuSubList.isEmpty?Fluttertoast.showToast(
                              msg: "Tapped on ${menu.title}",
                              fontSize: 14,
                              backgroundColor: Color(0xff828588),
                              textColor: !isDarkMode? Colors.black:Colors.white,
                            ):Container();
                          });
                        },
                        // leading: Icon(cdm.icon,color: Colors.white),
                        title: Text("${menu.title}",
                          style: TextStyle(color:!isDarkMode? Colors.black:appColors.white,fontSize: 16.5,fontWeight: FontWeight.w500),
                        ),
                        trailing: menu.menuSubList.isEmpty?
                        Icon(selected?Icons.keyboard_arrow_down:Icons.keyboard_arrow_down,color: Colors.transparent,):
                        Icon(selected?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up, color: Colors.grey,
                        ),
                        children:[
                          Container(
                            height: menu.menuSubList.isEmpty ? 0 : MediaQuery.of(context).size.height/6.25,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: menu.menuSubList.length,
                              itemBuilder: (BuildContext context, int index) {
                                //  if(index==0) return controlTile();
                                DrawerSubMenu menu2 = menu.menuSubList[index];
                                return Container(
                                  child:ListTile(
                                    minLeadingWidth: 0,
                                    minVerticalPadding:0,
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.only(left: 15,right: 15,top: 5),
                                    onTap: (){
                                      Fluttertoast.showToast(
                                          msg: "Tapped on ${menu2.title}",
                                          fontSize: 14,
                                          backgroundColor: Color(0xff828588),
                                          textColor: Colors.white
                                      );
                                    },
                                    title: Text("${menu2.title}",
                                      style: TextStyle(color: !isDarkMode? Colors.black.withOpacity(0.75):appColors.white.withOpacity(0.8),fontSize: 15.5,
                                        fontWeight: FontWeight.w500,),textAlign: TextAlign.start,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]),
                  );
                },
              ),
            ),
          ),
          // accountTile(),
        ],
      ),
    );
  }

  void expandOrShrinkDrawer(){
    setState(() {
      isExpanded = !isExpanded;
    });
  }

}
