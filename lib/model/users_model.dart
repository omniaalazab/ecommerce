class Users {
  String userName;
  String userMail;
  String userLastName;
  String userPassword;
  Users(
      {required this.userName,
      required this.userMail,
      required this.userPassword,
      required this.userLastName});
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userMail': userMail,
      'userLastName': userLastName,
      'userPassword': userPassword,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userName: map['userName'],
      userMail: map['userMail'],
      userLastName: map['userLastName'],
      userPassword: map['userPassword'],
    );
  }
}
