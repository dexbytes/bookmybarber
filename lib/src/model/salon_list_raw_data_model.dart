class SalonRawDataList {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double rating;
  final String timing;

  SalonRawDataList( {
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.rating,
    required this.timing,
  });
}


final List<SalonRawDataList> salonList = [
  SalonRawDataList(
      title: "RedBox Barber",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "https://t4.ftcdn.net/jpg/03/70/54/57/360_F_370545759_BB79gT7Uw9kdvy9TBIrQsEDnNwr56H38.jpg",
      timing: "8:30 am - 9:00pm",
      rating: 3.5
    // imageUrl: "assets/images/card_image.png",
  ),
  SalonRawDataList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl:"https://arsengurgov.com/wp-content/uploads/2014/11/women-hair-style.jpg",
      timing: "8:00 am - 7:45pm",
      rating: 3
    // imageUrl: "assets/images/card_image_2.png",
  ),
  SalonRawDataList(
      title: "Beauty Plus Spa",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "https://growknoxville.com/wp-content/uploads/2019/09/68879956_494737091097191_3511781349470265662_n.jpg",
      timing: "8:00 am - 7:45pm",
      rating: 4
    // imageUrl: "assets/images/card_image_2.png",
  ),
  SalonRawDataList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "https://www.wearegurgaon.com/wp-content/uploads/2020/03/blowdry-levante-salon-gurgaon.jpg",
      timing: "8:00 am - 7:45pm",
      rating: 4.5
    // imageUrl: "assets/images/card_image_2.png",
  ),
  SalonRawDataList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl:  "http://makhair.com.au/wp-content/uploads/2018/07/mak-hair-blog.jpg",
      timing: "8:00 am - 7:45pm",
      rating: 4
    // imageUrl: "assets/images/card_image_2.png",
  ),
  SalonRawDataList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl:"https://media.istockphoto.com/photos/woman-sitting-at-beauty-salon-making-hairdo-picture-id1002144830?k=20&m=1002144830&s=612x612&w=0&h=FqnHDeGB69xiEGLIHnjkxPPuc1DB8vRat05q53sal9Q=",
      timing: "8:00 am - 7:45pm",
      rating: 5
    // imageUrl: "assets/images/card_image_2.png",
  ),
];
