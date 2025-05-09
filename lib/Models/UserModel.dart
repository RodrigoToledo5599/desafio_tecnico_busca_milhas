


class UserModel{

  String? Id;
  String? Name;
  String? Email;
  String? Password;

  UserModel({
    this.Id,
    this.Name,
    this.Email,
    this.Password
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      Id: json['id'],
      Name: json['name'],
      Email: json['email'],
      Password: json['password']
    );
  }

  @override
  String toString(){
    return 'UserModel(Id: ${Id}, Name: ${Name}, Email: ${Email})';
  }
}