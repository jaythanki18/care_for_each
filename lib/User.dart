class UserModel{
  String email,password;

  UserModel(this.email,this.password);

  //constructor that convert json to object instance
  UserModel.fromJson(Map<String,dynamic> json) : email = json['email'], password = json['password'];

  //a method that convert object to json;
  Map<String,dynamic> toJson()=>{
    'email':email,
    'password':password
  };
}