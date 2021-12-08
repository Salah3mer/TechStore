class UserModel {
  String uId;
  String name;
  String email;
  String phone;

  UserModel({
    this.uId,
    this.name,
    this.email,
    this.phone,
  });

  UserModel.fromJson(Map<String,dynamic>json){
    uId=json['uId'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
  }

  Map<String,dynamic> toMap(){
    return {
      'uId' : uId,
      'name' : name,
      'email' : email,
      'phone' : phone,
    };
  }



}
