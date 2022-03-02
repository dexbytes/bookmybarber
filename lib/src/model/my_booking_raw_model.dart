class MyBookingRawDataModel {
  final String imageUrl;
  final String salonName;
  final String stylistName;
  final String date;
  final String time;
  final String service;
  final bool status;

  MyBookingRawDataModel( {
    required this.imageUrl,
    required this.service,
    required this.salonName,
    required this.stylistName,
    required this.date,
    required this.time,
    required this.status,

  });
}


final List<MyBookingRawDataModel> booking = [

 MyBookingRawDataModel(
 imageUrl: "http://makhair.com.au/wp-content/uploads/2018/07/mak-hair-blog.jpg",
 salonName: "RedBox Barber",
 stylistName: "Julia Chan",
 service: "Hair Service",
 date: '18 Jun 2022',
 time:'1:00 PM',
 status: true
),

 MyBookingRawDataModel(
 imageUrl:"https://arsengurgov.com/wp-content/uploads/2014/11/women-hair-style.jpg",
 salonName: "Looks Unisex Salon",
 stylistName: "Mike West",
 service: "Hair Cutting",
 date: '22 Jun 2022',
 time:'12:00 PM',
 status: false
),

 MyBookingRawDataModel(
 imageUrl:"https://growknoxville.com/wp-content/uploads/2019/09/68879956_494737091097191_3511781349470265662_n.jpg",
 salonName: "Beauty Spa ",
 stylistName: "kevin Doyle",
 service: "Hair Spa",
 date: '24 Jun 2022',
 time:'11:00 PM',
 status: false
),

 MyBookingRawDataModel(
 imageUrl:"https://i0.wp.com/thenextrushmagazine.com/wp-content/uploads/2020/02/shutterstock_437665477-e1582870022780.jpg?fit=800%2C534&ssl=1",
 salonName: "RedBox Barber",
 stylistName: "Edward",
 service: "Color Service",
 date: '24 Jun 2022',
 time:'11:00 PM',
 status: false
),

];