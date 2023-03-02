class UserModel {
  final String name;
  final String email;

  UserModel(this.name, this.email);

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}