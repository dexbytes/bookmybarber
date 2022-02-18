import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/welcome_screen.dart';
import 'package:base_flutter_app/src/widgets/custom_curve_maker_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int activeIndex = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    /*  Timer.periodic(Duration(minutes: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });*/
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }



  final tutorialModelList = [
    TutorialModel(
      imageUrl: "https://www.datocms-assets.com/6783/1625800465-gettyimages-687244776.jpg?fit=max&fm=jpg&w=1000",
      // 'assets/images/tutorial_image.png',
      title: 'Find and Book Services',
      description: 'Find and book Barber, Beauty,Salon & Spa\n services anywhere, anytime',
    ),
    TutorialModel(
      imageUrl:"http://static1.squarespace.com/static/5771909f46c3c46bb03baca6/577cf6858c60352def5c225f/5b6c6dd88985834a651f6c79/1533833188529/iStock_35379696_LARGE+-+Copy+%282%29.jpg?format=1500w",
      // 'assets/images/tutorial_image_2.png',
      title: 'Select Your Product',
      description: 'Choose your desire product\n that you want to buy.',
    ),
    TutorialModel(
      imageUrl:"https://img.freepik.com/free-photo/professional-girl-hairdresser-makes-client-haircut-girl-is-sitting-mask-beauty-salon_343596-4439.jpg?size=626&ext=jpg",
      // 'assets/images/tutorial_image.png',
      title: 'Style that fit your LifeStyle.',
      description: 'Choose our makeup special offer price\nPackage that fit your Lifestyle.',
    ),

  ];


  @override
  Widget build(BuildContext context) {

    Widget slideItem(int index) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   height: MediaQuery.of(context).size.height/1.9,
        //   decoration: BoxDecoration(
        //     // shape: BoxShape.circle,
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(150)),
        //     image: DecorationImage(
        //       image:
        //       NetworkImage(tutorialModelList[index].imageUrl),
        //       // AssetImage(tutorialModelList[index].imageUrl),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Container(
          child: ClipPath(
              clipper:CustomTutorialAppBar(),
              child: CachedNetworkImage(
                imageUrl: tutorialModelList[index].imageUrl,
                fit:BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height /1.8,
              )
          ),
        ),
        SizedBox(
          height: 35,
        ),
        AnimatedSmoothIndicator(
            activeIndex:activeIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight:10,
              dotWidth: 10,
              activeDotColor:Color(0xFFCCA76A),
              dotColor: Colors.grey,

            )),
        SizedBox(
          height: 35,
        ),
        Text(
          tutorialModelList[index].title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors().textHeadingColor1
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/9.6),
          child: Text(
            tutorialModelList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors().textNormalColor6.withOpacity(0.8)
            ),
          ),
        ),
      ],
    );

    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 60),
        child:CommonButton(
          buttonHeight: 50,
          buttonName: activeIndex == 2 ?"Get Started" :"Next",
          buttonColor:AppColors().buttonColor,
          textStyle: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff212327),),
          backCallback:(){
            activeIndex == 2 ?
            Navigator.push(
             context,
              SlideRightRoute(
                  widget: WelcomeScreen()),
            ):Container();
          },
          isBottomMarginRequired: false,
        ),
      );
    }

    return Scaffold(
      backgroundColor:Color(0xff212327),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            ContainerMenuPage(
              // bottomBarSafeAreaColor: Colors.transparent,
              contextCurrentView: context,
              // appBackgroundColor: Colors.white,
              // scrollPadding: EdgeInsets.only(bottom: 81),
              /* statusBarColor: Colors.amber,
                bottomBarSafeAreaColor: Colors.amber,*/
              isSingleChildScrollViewNeed: false,
              isFixedDeviceHeight: true,
              appBarHeight: -1,
              appBar: Container(
                height: -1,
                // color: Colors.white,
                // child: appBarWithBackArrow(
                //     isTitleVisible: false,
                //     isTrailingIconVisible: false,
                //     leadingIconColor: Colors.black,
                //   onPress: (){}
                // ),
              ),
              containChild: Container(
                color: Color(0xff212327),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            // alignment: AlignmentDirectional.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height/1.1,
                                child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: _pageController,
                                  // onPageChanged: _onPageChanged,
                                  onPageChanged: (index) =>
                                      setState(() => activeIndex = index),

                                  itemCount: tutorialModelList.length,
                                  itemBuilder: (ctx, index) => slideItem(index),
                                ),
                              ),
                              SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: bottomButton())
          ],
        ),
      ),
    );
  }
}

class TutorialModel {
  final String imageUrl;
  final String title;
  final String description;

  TutorialModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}