class PackageCardList {
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;

  PackageCardList( {
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.price,
  });
}

final List<PackageCardList> package = [

  PackageCardList(
      title: "Bridal Beauty Makeup",
      subtitle: "Completed Package offer till Sep 18,2022",
      // imageUrl: "https://cdn0.weddingwire.com/vendor/797120/3_2/960/jpg/img-7248_51_2021797-162386788267637.jpeg",
      imageUrl: "https://images.squarespace-cdn.com/content/v1/5f719e9f4031873ee2ea7973/1604852869362-2MCGX8ECAD01FUX49FD2/beautiful-bridal-parrty-makeup-Amy-George.jpg",
      price: 280.30
    // imageUrl: "assets/images/card_image_2.png",
  ),
  PackageCardList(
      title: "Haircut & Hairstyle",
      subtitle: "Luxury Package offer till Nov 24,2022",
      imageUrl: "https://img4.nbstatic.in/tr:w-500/5bfcf1aa5f1503000dc4826b.jpg",
      price: 160.45
    // imageUrl: "assets/images/card_image_2.png",
  ),
  PackageCardList(
      title: "Hair Coloring",
      subtitle: "Complete Package offer till Oct 10,2022",
      imageUrl: "https://ak.picdn.net/offset/photos/5fa580126f52af4409e4f310/medium/offset_1033750.jpg?DFghwDcb",
      price: 140.30
    // imageUrl: "assets/images/card_image_2.png",
  ),
  PackageCardList(
      title: "Beard Styling & Coloring",
      subtitle: "Complete Package offer till Jun 10,2022",
      imageUrl: "https://barbershop-heerlen.nl/wp-content/uploads/2016/05/Barbershop-Limburg.jpg",
      price: 210.30
    // imageUrl: "assets/images/card_image_2.png",
  ),
];
