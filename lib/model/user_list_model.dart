class UsersListModel {
  String email;
  String password;
  String fName;
  String lName;

  UsersListModel({
    required this.email,
    required this.password,
    required this.fName,
    required this.lName,
  });

  factory UsersListModel.fromJson(Map<String, dynamic> json) => UsersListModel(
        email: json["email"],
        password: json["password"],
        fName: json["f_name"],
        lName: json["l_name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "f_name": fName,
        "l_name": lName,
      };
}
