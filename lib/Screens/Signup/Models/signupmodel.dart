class SignUpModel {
  String email;
  String password;
  String phonenumber;
  String firstname;
  String lastname;
  SignUpModel(
      {required this.password,
      required this.lastname,
      required this.firstname,
      required this.email,
      required this.phonenumber});
  factory SignUpModel.fromJson(Map<String, dynamic> map) {
    return SignUpModel(
        password: map["password"],
        lastname: map["lastname"],
        firstname: map["firstname"],
        email: map["email"],
        phonenumber: map["phonenumber"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "phonenumber": phonenumber
    };
  }
}
