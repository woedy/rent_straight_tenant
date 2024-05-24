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
  String? dateOfBirth;
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
        this.dateOfBirth,
        this.age,
        this.idType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    username = json['username'];
    avatar = json['avatar'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    idType = json['id_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['date_of_birth'] = this.dateOfBirth;
    data['age'] = this.age;
    data['id_type'] = this.idType;
    return data;
  }
}
