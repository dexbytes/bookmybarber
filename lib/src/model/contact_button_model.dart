class ContactButtonModel
{
  bool clickStatus;
  int id ;
  String name ;



  ContactButtonModel({required this.clickStatus, required this.name,this.id = 0, img});


  factory ContactButtonModel.fromJson(Map<String, dynamic> json) {
    return ContactButtonModel(
      clickStatus: json['clickStatus'],
      name: json['name'],



    );
  }

}

