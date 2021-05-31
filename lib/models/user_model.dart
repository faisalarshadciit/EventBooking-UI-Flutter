class UserModel {
  String userId;
  String userName;
  String userEmail;
  String userGender;
  String userPhone;
  String userPassword;

  UserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userGender,
      this.userPhone,
      this.userPassword});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      userName: json["userName"],
      userEmail: json["userEmail"],
      userGender: json["userGender"],
      userPhone: json["userPhone"],
      userPassword: json["userPassword"],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'userEmail': userEmail,
        'userGender': userGender,
        'userPhone': userPhone,
        'userPassword': userPassword,
      };
}
