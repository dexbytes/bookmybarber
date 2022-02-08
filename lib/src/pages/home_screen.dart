import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/widgets/appbar/appbar_with_backarrow.dart';
import 'package:base_flutter_app/src/widgets/appbar/custom_appbar.dart';
import 'package:base_flutter_app/src/widgets/barber_specialist_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/categories_circular_widget.dart';
import 'package:base_flutter_app/src/widgets/home_card_widget.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key,})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    Widget categories = Container(
        margin: EdgeInsets.only(
            right: 0, left: 20),
        height: 150,
        child: CategoriesCircularWidget()
    );

    Widget barberSpecialist = Container(
        margin: EdgeInsets.only(
            right: 0, left: 10),
        height: 130,
        child: BarberSpecialistCircularWidget()
    );

    Widget services = Container(
        margin: EdgeInsets.only(
            right: 0, left: 20),
        height: 150,
        child: CategoriesCircularWidget(
          isListTwoVisible: true,
        )
    );

    Widget homeCard = Container(
        margin: EdgeInsets.only(
            left: 18, right: 0,
            top: 15 ),
        height: 185,
        child: HomeCardWidget()

    );






    //Return main Ui view
    return WillPopScope(
        onWillPop: null, //_onBackPressed,
        child: ContainerMenuPage(
            contextCurrentView: context,
            scrollPadding: EdgeInsets.only(bottom: 110),
            /* statusBarColor: Colors.amber,
          bottomBarSafeAreaColor: Colors.amber,*/
            isSingleChildScrollViewNeed: true,
            isFixedDeviceHeight: true,
            appBarHeight: 310,
            appBar: Container(
                color: Color(0xff212327),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 3,
                child:appBarWithCurve()
            ),
            containChild: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0),
                  color: Color(0xff212327),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      SeeAllTextRow(leftTitle: "Top categories",),
                      categories,
                      SizedBox(height: 15,),
                      SeeAllTextRow(leftTitle: "Best salon",),
                      homeCard,
                      SizedBox(height: 30,),
                      SeeAllTextRow(leftTitle: "Top services",),
                      services,
                      SizedBox(height: 15,),
                      SeeAllTextRow(leftTitle: "Popular salon nearby",),
                      homeCard,
                      SizedBox(height: 30,),
                      SeeAllTextRow(leftTitle: "Barber Specialist",),
                      barberSpecialist,
                      SizedBox(height: 15,),
                      SeeAllTextRow(leftTitle: "Popular salon nearby",),
                      homeCard,
                    ],
                  ),
                ),
                // Container(
                //     color: Color(0xff212327),
                //     width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.height / 3,
                //     child:appBarWithCurve()
                // ),
              ],
            ))

    );
  }
}

