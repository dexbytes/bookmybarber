class HomeCardList {
  final String title;
  final String subtitle;
  final String imageUrl;

  HomeCardList( {
    required this.title,
    required this.imageUrl,
    required this.subtitle,
  });
}

final List<HomeCardList> home = [
  HomeCardList(
      title: "RedBox Barber",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "https://t4.ftcdn.net/jpg/03/70/54/57/360_F_370545759_BB79gT7Uw9kdvy9TBIrQsEDnNwr56H38.jpg"
    // imageUrl: "assets/images/card_image.png",
  ),
  HomeCardList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSthQUeWFo_SU59tLgllRxMCrGpQYKaw2nWHw&usqp=CAU"
    // imageUrl: "assets/images/card_image_2.png",
  ),
];

final List<HomeCardList> home2 = [
  HomeCardList(
      title: "Looks UniSex Salon",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "https://northernvirginiamag.com/wp-content/uploads/2018/12/hair-stylist.jpg"
  ),
  HomeCardList(
      title: "RedBox Barber",
      subtitle: "288 McClure Court, Arkansas",
      imageUrl: "http://www.elixirstylists.com/blog/wp-content/uploads/2020/04/Best-Beauty-Salon-in-Hyderabad-738x423.jpg"
    // imageUrl: "https://i0.wp.com/thenextrushmagazine.com/wp-content/uploads/2020/02/shutterstock_437665477-e1582870022780.jpg?fit=800%2C534&ssl=1"
  ),
];