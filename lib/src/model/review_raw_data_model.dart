class ReviewRawDataModel {
  final String imageUrl;
  final String name;
  final String daysAgo;
  final double rating;
  final String subtitle;

  ReviewRawDataModel( {
    required this.imageUrl,
    required this.subtitle,
    required this.name,
    required this.daysAgo,
    required this.rating,

  });
}

final List<ReviewRawDataModel> review = [
  ReviewRawDataModel(
      imageUrl: "https://preview.redd.it/wrbtpfycbcn01.jpg?auto=webp&s=8f86794ec613732dc0aed43847f4b6c1b7e52c62",
      name: "Julia Chan",
      rating: 3,
      daysAgo: '2 hours ago ',
      subtitle: "Ben Johnson is very friendy and polite. When I came to her in August 2019. She made a proper & good cutting. "
    // imageUrl: "assets/images/card_image.png",
  ),
  ReviewRawDataModel(
      imageUrl: "https://media.gq.com/photos/5a0b201485eb8b728aa3ba99/3:4/w_999,h_1332,c_limit/gq-gal-gadot-accent.jpg",
      name: "Gal Gadot",
      rating: 2,
      daysAgo: '2 months ago ',
      subtitle: "It can get pretty crowded at office hours, the place are considered cozy, the pricing are ok,"
               " lots of eye-catching things, the barber are experienced, they know what you want. Recommended."
                // "Awesome place to get your haircut done Right. the staff and service are excellent, "
                // " This place also offer some decent Pomade for your hair and any other hair products.",
    // imageUrl: "assets/images/card_image.png",
  ),
 ReviewRawDataModel(
      imageUrl: "https://hips.hearstapps.com/cos.h-cdn.co/assets/cm/14/25/53a09742be2c0_-_cos-01-emma-stone-today-show-de.jpg?resize=480:*",
      name: "Emma Stone",
      rating: 4,
      daysAgo: '3 months ago ',
      subtitle: "Awesome place to get your haircut done Right. the staff and service are excellent, "
                " This place also offer some decent Pomade for your hair and any other hair products.",
    // imageUrl: "assets/images/card_image.png",
  ),


];