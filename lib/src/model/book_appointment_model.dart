class ServicesRawDataList {
  final String title;
  final double price;
  final String imageUrl;

  ServicesRawDataList({
    required this.title,
    required this.price,
    required this.imageUrl,


  });
}


class BookServicesRawDataList2 {
  final String name;
  final List<ServicesRawDataList> subtitle;


  BookServicesRawDataList2( {
    required this.name,
    required this.subtitle,

  });
}

final List<BookServicesRawDataList2> serviceList = [

 BookServicesRawDataList2(
  name: "Hair Style",
  subtitle:[
    ServicesRawDataList(
      title: 'Cool Messy',
      price:  20,
      imageUrl: "https://menhairstylesworld.com/wp-content/uploads/2017/07/Messy-Wild-Quiff.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
    ServicesRawDataList(
      title: 'Mid Bald Fade',
      price:  25,
      imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Mens-Hairstyles-Hi-Lo-Fade-with-Modern-Quiff-Hairstyle.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
    ServicesRawDataList(
      title: 'High Undercut Fade',
      price:  15,
      imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Hairstyles-For-Men.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
    ServicesRawDataList(
      title: 'Burst Fade Mohawk',
      price:  30,
      imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Textured-Slicked-Back-Hair-with-Disconnected-Undercut.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
    ServicesRawDataList(
      title: 'Mid BaldFade Quiff',
      price:  22,
      imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Guy-Haircuts-Low-Fade-and-Long-Top-with-Beard.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
    ServicesRawDataList(
      title: 'High SkinFade Spiky Hair',
      price:  28,
      imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Trendy-Haircuts-Bald-Fade-with-Shape-Up-and-Spiky-Hair.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
    ServicesRawDataList(
      title: 'Short Side Swept Fade',
      price:  18,
      imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2019/06/Short-Side-Swept-Fade.jpg",
      // imageUrl: 'assets/images/barber_image.png',
    ),
  ]
),

 BookServicesRawDataList2(
  name: "Shaving",
     subtitle:[
       ServicesRawDataList(
         title: 'Van Duke Beard',
         price:  30,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2018/04/how-to-beard-styles-full-van-duke-683x1024.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Anchor Beard',
         price:  25,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2021/12/how-to-beard-styles-anchor-van-dyke-683x1024.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Chinstrap Beard',
         price:  35,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2021/12/how-to-beard-styles-chinstrap-goatee-short-hair-683x1024.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Viking Beard',
         price:  25,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2018/04/how-to-beard-styles-viking-full-red-683x1024.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Arabic Beard',
         price:  30,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2021/02/how-to-beard-styles-arabic-fade-full-undercut-curly-683x1024.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Horseshoe Mustache',
         price:  35,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2021/02/how-to-beard-styles-horseshoe-mustache-683x1024.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Scruff Beard',
         price:  20,
         imageUrl: "https://menshaircuts.com/wp-content/uploads/2018/04/how-to-beard-styles-scruff-swept-back-hair.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
     ]

),

 BookServicesRawDataList2(
  name: "Styling",
     subtitle:[
       ServicesRawDataList(
         title: 'Cool Messy',
         price:  20,
         imageUrl: "https://menhairstylesworld.com/wp-content/uploads/2017/07/Messy-Wild-Quiff.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid Bald Fade',
         price:  25,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Mens-Hairstyles-Hi-Lo-Fade-with-Modern-Quiff-Hairstyle.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High Undercut Fade',
         price:  15,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Hairstyles-For-Men.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Burst Fade Mohawk',
         price:  30,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Textured-Slicked-Back-Hair-with-Disconnected-Undercut.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid BaldFade Quiff',
         price:  22,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Guy-Haircuts-Low-Fade-and-Long-Top-with-Beard.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High SkinFade Spiky Hair',
         price:  28,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Trendy-Haircuts-Bald-Fade-with-Shape-Up-and-Spiky-Hair.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Short Side Swept Fade',
         price:  18,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2019/06/Short-Side-Swept-Fade.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
     ]
),

 BookServicesRawDataList2(
  name: "Facial",
     subtitle:[
       ServicesRawDataList(
         title: 'Cool Messy',
         price:  20,
         imageUrl: "https://menhairstylesworld.com/wp-content/uploads/2017/07/Messy-Wild-Quiff.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid Bald Fade',
         price:  25,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Mens-Hairstyles-Hi-Lo-Fade-with-Modern-Quiff-Hairstyle.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High Undercut Fade',
         price:  15,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Hairstyles-For-Men.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Burst Fade Mohawk',
         price:  30,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Textured-Slicked-Back-Hair-with-Disconnected-Undercut.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid BaldFade Quiff',
         price:  22,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Guy-Haircuts-Low-Fade-and-Long-Top-with-Beard.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High SkinFade Spiky Hair',
         price:  28,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Trendy-Haircuts-Bald-Fade-with-Shape-Up-and-Spiky-Hair.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Short Side Swept Fade',
         price:  18,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2019/06/Short-Side-Swept-Fade.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
     ]
),

 BookServicesRawDataList2(
  name: "Hair Color",
     subtitle:[
       ServicesRawDataList(
         title: 'Cool Messy',
         price:  20,
         imageUrl: "https://menhairstylesworld.com/wp-content/uploads/2017/07/Messy-Wild-Quiff.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid Bald Fade',
         price:  25,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Mens-Hairstyles-Hi-Lo-Fade-with-Modern-Quiff-Hairstyle.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High Undercut Fade',
         price:  15,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Hairstyles-For-Men.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Burst Fade Mohawk',
         price:  30,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Textured-Slicked-Back-Hair-with-Disconnected-Undercut.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid BaldFade Quiff',
         price:  22,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Guy-Haircuts-Low-Fade-and-Long-Top-with-Beard.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High SkinFade Spiky Hair',
         price:  28,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Trendy-Haircuts-Bald-Fade-with-Shape-Up-and-Spiky-Hair.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Short Side Swept Fade',
         price:  18,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2019/06/Short-Side-Swept-Fade.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
     ]
),

 BookServicesRawDataList2(
  name: "Trimming",
     subtitle:[
       ServicesRawDataList(
         title: 'Cool Messy',
         price:  20,
         imageUrl: "https://menhairstylesworld.com/wp-content/uploads/2017/07/Messy-Wild-Quiff.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid Bald Fade',
         price:  25,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Mens-Hairstyles-Hi-Lo-Fade-with-Modern-Quiff-Hairstyle.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High Undercut Fade',
         price:  15,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Hairstyles-For-Men.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Burst Fade Mohawk',
         price:  30,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Textured-Slicked-Back-Hair-with-Disconnected-Undercut.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid BaldFade Quiff',
         price:  22,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Guy-Haircuts-Low-Fade-and-Long-Top-with-Beard.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High SkinFade Spiky Hair',
         price:  28,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Trendy-Haircuts-Bald-Fade-with-Shape-Up-and-Spiky-Hair.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Short Side Swept Fade',
         price:  18,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2019/06/Short-Side-Swept-Fade.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
     ]
),

 BookServicesRawDataList2(
  name: "Hair cut",
     subtitle:[
       ServicesRawDataList(
         title: 'Cool Messy',
         price:  20,
         imageUrl: "https://menhairstylesworld.com/wp-content/uploads/2017/07/Messy-Wild-Quiff.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid Bald Fade',
         price:  25,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Mens-Hairstyles-Hi-Lo-Fade-with-Modern-Quiff-Hairstyle.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High Undercut Fade',
         price:  15,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Hairstyles-For-Men.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Burst Fade Mohawk',
         price:  30,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Textured-Slicked-Back-Hair-with-Disconnected-Undercut.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Mid BaldFade Quiff',
         price:  22,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Guy-Haircuts-Low-Fade-and-Long-Top-with-Beard.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'High SkinFade Spiky Hair',
         price:  28,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2015/12/Cool-Trendy-Haircuts-Bald-Fade-with-Shape-Up-and-Spiky-Hair.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Short Side Swept Fade',
         price:  18,
         imageUrl: "https://www.menshairstylestoday.com/wp-content/uploads/2019/06/Short-Side-Swept-Fade.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
     ]
),


];