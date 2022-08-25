class UserModel{
  final String name;
  final String email;
  final String homeTown;
  final String image;
  final String contactNo;
  final String id;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.homeTown,  
    required this.contactNo, 
    required this.id,
  });

  Map<String,dynamic>toJson()=>
  {
    'name':name,
    'email':email,
    'home_town':homeTown,
    'contact_no':contactNo,
    'image':image,    
  };
}