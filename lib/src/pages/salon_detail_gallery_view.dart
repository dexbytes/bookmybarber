import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/model/photo_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/photo_slider_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class SalonGalleryViewScreen extends StatefulWidget {
  final bool isDataScroll;

  final collapsedheight;
  const SalonGalleryViewScreen({Key? key, this.isDataScroll = true, this.collapsedheight}) : super(key: key);

  @override
  State<SalonGalleryViewScreen> createState() => _SalonGalleryViewScreenState();
}

class _SalonGalleryViewScreenState extends State<SalonGalleryViewScreen> {
  late ScrollController _scrollController;
  bool isScrollable = true;

  @override
  void didUpdateWidget(covariant SalonGalleryViewScreen oldWidget) {
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

    return StaggeredGridView.countBuilder(
      controller: _scrollController,
      padding: EdgeInsets.only(top:  widget.isDataScroll?widget.collapsedheight+15:15),
      physics:  widget.isDataScroll && isScrollable?ClampingScrollPhysics():NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      itemCount: photo.length,
      itemBuilder: (context, index) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            print(photo[index].id,);
            Navigator.push(
              context,
              SlideRightRoute(
                  widget: PhotoSliderScreen(
                   urlImages:photo,
                   initialPage:index,
                   isDotVisible: true,
                   activeDotColor: Color(0xffE4B343),
                   dotHeight: 8,
                   dotWidth: 8,

                  )),
            );
          },
          child:ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl:photo[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 5 == 0) ? 2 : 1, (index % 5 == 0) ? 1.6 : 0.8),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
