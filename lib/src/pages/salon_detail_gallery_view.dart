import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/model/photo_raw_data_model.dart';
import 'package:base_flutter_app/src/widgets/slider_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class SalonGalleryViewScreen extends StatelessWidget {
  const SalonGalleryViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(top: 15),
      physics: NeverScrollableScrollPhysics(),
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
                  widget: SliderScreen(
                   urlImages:photo,
                   initialPage:index,
                   isDotVisible: true,
                   activeDotColor: Color(0xffE4B343),
                   dotHeight: 8,
                   dotWidth: 8,
                   topMargin: MediaQuery.of(context).size.height /7.5,

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
