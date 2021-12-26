class UserModel {
  String uId;
  String name;
  String email;
  String phone;
  String pass;

  UserModel({
    this.uId,
    this.name,
    this.email,
    this.phone,
    this.pass,
  });

  UserModel.fromJson(Map<String,dynamic>json){
    uId=json['uId'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    pass=json['pass'];
  }

  Map<String,dynamic> toMap(){
    return {
      'uId' : uId,
      'name' : name,
      'email' : email,
      'phone' : phone,
      'pass' : pass,
    };
  }



}
