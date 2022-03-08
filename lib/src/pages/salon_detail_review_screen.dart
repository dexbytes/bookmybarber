import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:base_flutter_app/src/widgets/Review_screen_view.dart';
import 'package:base_flutter_app/src/widgets/see_all_text_row.dart';
import 'package:base_flutter_app/src/widgets/star_rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SalonDetailReviewScreen extends StatefulWidget {
  final bool isScrollable;
  final bool isDataScroll;

  final collapsedheight;
  const SalonDetailReviewScreen({Key? key, this.isScrollable = true, this.isDataScroll = true, this.collapsedheight,}) : super(key: key);
  @override
  _SalonDetailAboutScreenState createState() => _SalonDetailAboutScreenState();
}

class _SalonDetailAboutScreenState extends State<SalonDetailReviewScreen> {
  late ScrollController _scrollController;
  bool isScrollable = true;
  Map<String, TextEditingController> controllers = {
    'review': new TextEditingController(),

  };

  Map<String, FocusNode> focusNodes = {
    'review': new FocusNode(),
  };

  Map<String, String> errorMessages = {
    'review': "",
  };


  bool isMore = false;

  @override
  void didUpdateWidget(covariant SalonDetailReviewScreen oldWidget) {
    isScrollable = widget.isDataScroll;
    setState(() {});
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }


  @override
  void initState() {
    // TODO: implement initState

    _scrollController = ScrollController()
      ..addListener(
              (){
            print(_scrollController.position.pixels);


            setState(() {
              isScrollable =  _scrollController.position.pixels > 0;
            });
          }
      );
  }

  @override
  Widget build(BuildContext context) {
  String imageUrl = "https://i.pinimg.com/originals/4d/72/1a/4d721a17b1c40775eb535fa1bc46567d.jpg";


    Widget review = Container(
        padding: EdgeInsets.only(left: 10,),
        height: MediaQuery.of(context).size.height +250,
        child: ReviewListView(
          onTap: (){
            setState(() {
              isMore = !isMore;
            });
          },
          isLess: isMore,
        )


    );

    _reviewField() {
      return Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(bottom: BorderSide(color: Colors.grey,width: 0.3,))
        ),
        padding: EdgeInsets.only(left: 10,right: 15,top: 20),
        margin:  EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Write your Review",
                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:Color(0xff828588)),),
                StarRatingBar(
                  removeItemRating: true,
                  removeViewCount: true,
                  iconCount: 5,
                  iconSize: 20,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.only(right: 10),
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Color(0xffCCA76A) ),
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color:Color(0xff323446)),
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl:imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )
                    )
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 0,right: 0,top: 15
                    ),
                    width: MediaQuery.of(context).size.width ,
                    child: CommonTextFieldWithError(
                      focusNode: focusNodes['review'],
                      isShowBottomErrorMsg: true,
                      errorMessages: errorMessages['review']?.toString()??'',
                      controllerT: controllers['review'],
                      borderRadius: 50,
                      inputHeight: 46,
                      errorLeftRightMargin: 0,
                      errorMsgHeight: 8,
                      autoFocus: false,
                      capitalization: CapitalizationText.sentences,
                      cursorColor: Colors.grey,
                      enabledBorderColor: Color(0xff323446),
                      focusedBorderColor:Color(0xff323446),
                      backgroundColor: Color(0xff323446),
                      borderStyle: BorderStyle.none,
                      inputKeyboardType: InputKeyboardTypeWithError.text,
                      textInputAction: TextInputAction.next,
                      inputFieldSuffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.5),
                        child: IconButton(
                          onPressed:(){},
                          icon: iconApps.iconImage(imageUrl: iconApps.micIcon,
                              imageColor:Colors.white,iconSize: Size(20, 20)),
                        ),
                      ),
                      hintText: "Leave your experience..",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff828588),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.only(left: 25),
                      onTextChange: (value) {
                        // _checkName(value, 'user_name', onchange: true);
                      },
                      onEndEditing: (value) {
                        // _checkName(value, 'user_name');
                        FocusScope.of(context).requestFocus(focusNodes['review']);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3.0,right: 5),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                    "Post"
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    primary: Color(0xffE4B343),
                    onPrimary: Colors.black,
                    minimumSize: Size(70, 30)),
              ),
            ),
          ],
        ),
      );
    }




    return ListView(
      controller: _scrollController,
      physics: widget.isDataScroll && isScrollable ? ClampingScrollPhysics():NeverScrollableScrollPhysics(),
      children: [
        //SizedBox(height:  widget.isDataScroll?widget.collapsedheight:0,),
            _reviewField(),
            SeeAllTextRow(
              margin: EdgeInsets.only(left: 20,top: 15,),
              leftTitle: "All Reviews (128)",
              isRightTextVisible: false,
              leftTitleTextStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color:Color(0xFFCCA76A)) ,
            ),
            review
          ],
        );
  }
}
