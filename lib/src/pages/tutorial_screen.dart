import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/welcome_screen.dart';
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
      imageUrl:  'assets/images/tutorial_image.png',
      title: 'Find and Book Services',
      description: 'Find and book Barber, Beauty,Salon & Spa\n services anywhere, anytime',
    ),
    TutorialModel(
      imageUrl:  'assets/images/tutorial_image_2.png',
      title: 'Select Your Product',
      description: 'Choose your desire product\n that you want to buy.',
    ),
    TutorialModel(
      imageUrl:  'assets/images/tutorial_image.png',
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
        Container(
          height: MediaQuery.of(context).size.height/1.9,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(tutorialModelList[index].imageUrl),
              fit: BoxFit.fill,
            ),
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