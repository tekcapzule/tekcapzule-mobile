class UserModel {
  final String name;
  final String email;
  final String birthdate;
  final String phoneNumber;
  final String gender;
  final String givenName;
  final String preferredUsername;

  UserModel(this.name, this.email, this.birthdate, this.phoneNumber,
      this.gender, this.givenName, this.preferredUsername);

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        birthdate = json['birthdate'],
        phoneNumber = json['phone_number'],
        gender = json['gender'],
        givenName = json['given_name'],
        preferredUsername = json['preferred_username'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'birthdate': birthdate,
        'phone_number': phoneNumber,
        'gender': gender,
        'given_name': givenName,
        'preferred_username': preferredUsername,
      };
}
