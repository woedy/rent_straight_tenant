class UserDataModel {
  Data? data;
  String? message;

  UserDataModel({this.data, this.message});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? uuid;
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? username;
  String? avatar;
  String? age;
  String? idType;

  Data(
      {this.id,
        this.uuid,
        this.fullName,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.username,
        this.avatar,
        this.age,
        this.idType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    fullName = json['fullName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    username = json['username'];
    avatar = json['avatar'];
    age = json['age'];
    idType = json['idType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['fullName'] = this.fullName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['age'] = this.age;
    data['idType'] = this.idType;
    return data;
  }
}
