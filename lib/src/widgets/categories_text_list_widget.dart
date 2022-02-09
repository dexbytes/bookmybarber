import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriesTextWidget extends StatefulWidget {
  final onClickCardCallBack;

  CategoriesTextWidget({Key? key,
    this.onClickCardCallBack,
  }) : super(key: key);

  @override
  State<CategoriesTextWidget> createState() => _CategoriesTextWidgetState();
}

class _CategoriesTextWidgetState extends State<CategoriesTextWidget> {
  List<CategoriesList> categories = [
    CategoriesList(
      title: 'Hairstyle',
    ),
    CategoriesList(
      title: 'Facial',
    ),
    CategoriesList(
      title: 'Trimming',
    ),
    CategoriesList(
      title: 'Shaving',
    ),
    CategoriesList(
      title: 'Eyebrow',
    ),

  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 18),
      physics: ClampingScrollPhysics(),
      itemCount: categories.length ,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              print("$index",);
              this.widget.onClickCardCallBack?.call(index);
              setState(() {
                activeIndex = index;
              });


            },
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( categories[index].title,style:
                TextStyle(fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: activeIndex == index ?Colors.white :Color(0xffCCA76A))),
              ],
            ),
          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,         //for most popular item list count : 2  & for BrandCardView count :4
        mainAxisSpacing: 5,       //for most popular item list mainSpacing : 5  & for BrandCardView mainSpacing : 10
        mainAxisExtent: 80
    ),
    );

  }
}

class CategoriesList {
  final String title;

  CategoriesList( {
    required this.title,
  });
}

