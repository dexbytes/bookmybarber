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
         title: 'Purple & Pink',
         price:  20,
         imageUrl: "https://content.latest-hairstyles.com/wp-content/uploads/purple-pink-mens-hair-color-500x500.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Platinum Blonde',
         price:  25,
         imageUrl: "https://content.latest-hairstyles.com/wp-content/uploads/platinum-fire-mens-hair-color-500x625.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Silver Hipster',
         price:  15,
         imageUrl: "https://content.latest-hairstyles.com/wp-content/uploads/trendy-silver-hipster-mens-color.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Ash Grey',
         price:  30,
         imageUrl: "https://content.latest-hairstyles.com/wp-content/uploads/trendy-grey-mens-color.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Copper Brown',
         price:  22,
         imageUrl: "https://content.latest-hairstyles.com/wp-content/uploads/2013/10/copper-brown.jpg",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Black To Silver Ombre',
         price:  28,
         imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtp-uzcrFqABVaZy87HszfJNHvyqPYl3aIW0OEvqE6YIp48cW9w7tZ6HtsKVkOCkGvVqI&usqp=CAU",
         // imageUrl: 'assets/images/barber_image.png',
       ),
       ServicesRawDataList(
         title: 'Natural Light Brown ',
         price:  18,
         imageUrl: "https://i.pinimg.com/736x/9f/60/0d/9f600d4ffb0ef9baec6147b15dcc8aa5.jpg",
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


final List<BookServicesRawDataList2> serviceListFemale = [

  BookServicesRawDataList2(
      name: "Hair Cut",
      subtitle:[
        ServicesRawDataList(
          title: 'Relaxed Bob',
          price:  20,
          imageUrl: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gh-050721-assymetrical-bob-haircuts-1623076533.png?crop=0.500xw:1.00xh;0.500xw,0&resize=640:*",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Blunt Bob',
          price:  25,
          imageUrl: "https://i2.wp.com/www.hadviser.com/wp-content/uploads/2020/03/3-side-parted-bob-for-thin-hair-B8ewA1Fnb60.jpg?resize=1080%2C1080&ssl=1",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Modern Mullet',
          price:  15,
          imageUrl: "https://lovehairstyles.com/wp-content/uploads/2021/04/female-mullet-classy-haircut-683x1024.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Long Pixel',
          price:  30,
          imageUrl: "https://content.latest-hairstyles.com/wp-content/uploads/long-pixie-cuts.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Tapered Layers',
          price:  22,
          imageUrl: "https://i2.wp.com/www.hadviser.com/wp-content/uploads/2021/01/5-piece-y-haircut-for-women-CGk9Oh_gYBA.jpg?resize=1080%2C1350&ssl=1",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Modern Diana ',
          price:  28,
          imageUrl: "https://media.glamour.com/photos/60006f6594257b37bbadd3e8/master/w_1280%2Cc_limit/136948668_218368419785606_1547125232883172252_n.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Deep Side Part',
          price:  18,
          imageUrl: "https://www.thetrendspotter.net/wp-content/uploads/2018/11/deep-side-part-lob.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
      ]
  ),

  BookServicesRawDataList2(
      name: "Make up",
      subtitle:[
        ServicesRawDataList(
          title: 'Bridal Makeup',
          price:  40,
          imageUrl: "https://headqueenwithmister.com/wp-content/uploads/2022/02/34.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Professional Makeup',
          price:  60,
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShH0SvPGd8UWkK0bfipu6naC_Lx78kmgWqJ7cEkn7kRSN-w_yvcRxkUEPcKSTpio9rMvU&usqp=CAU",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Airbrush Makeup',
          price:  45,
          imageUrl: "https://www.dermascope.com/media/k2/items/cache/fd0bac1dd9ecbd2d7b8565b84798a1fb_XL.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Mineral Makeup',
          price:  35,
          imageUrl: "https://static.toiimg.com/thumb/msid-17858781,width-800,height-600,resizemode-75/17858781.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Shimmer Makeup',
          price:  22,
          imageUrl: "https://femina.wwmindia.com/thumb/content/2020/feb/glitter-eyeshadow-looks1582291555.jpg?width=1200&height=900",
          // imageUrl: 'assets/images/barber_image.png',
        ),
      ]
  ),

  BookServicesRawDataList2(
      name: "Spa",
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
          title: 'Sunflower Blonde',
          price:  20,
          imageUrl: "https://i.pinimg.com/originals/df/16/0d/df160dbf461abab05805fcd087ef4f6c.png",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Caramel',
          price:  25,
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnE6fhfN5KiEBdKfCWIIMOF7wC-QLmzC3f2QC9pOoziPdg1SLDqK2c39LahazBwlgjjV4&usqp=CAU",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Hot-Toffee',
          price:  15,
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcC9CJ0TD4DH5IcCoJ-wGVyX7cBDc3itqI90QedgFK_VHzbiRpCMOBAobJks2Zzajuads&usqp=CAU",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Havana Brown',
          price:  30,
          imageUrl: "https://i2.wp.com/therighthairstyles.com/wp-content/uploads/2014/12/5-chestnut-brown-hue.jpg?resize=500%2C603",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Espresso',
          price:  22,
          imageUrl: "https://blog.wella.com/sites/default/files/small-image/wellaproblogespressohairimage1.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Crushed Garnet',
          price:  28,
          imageUrl: "https://i.pinimg.com/originals/27/63/36/2763366f8d0925163f5cf3e5799f8f4e.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
        ServicesRawDataList(
          title: 'Light Golden Blonde',
          price:  18,
          imageUrl: "https://blog.wella.com/sites/default/files/small-image/wellaprobloggoldenblondehairimage2.jpg",
          // imageUrl: 'assets/images/barber_image.png',
        ),
      ]
  ),

  BookServicesRawDataList2(
      name: "Bridal",
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
      name: "Nail",
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