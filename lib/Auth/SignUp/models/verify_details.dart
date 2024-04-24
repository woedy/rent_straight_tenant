class VerifyDetailsModel {
  Data? data;
  Errors? errors;
  String? message;

  VerifyDetailsModel({this.data, this.errors, this.message});

  VerifyDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? email;
  String? username;
  String? phoneNumber;

  Data({this.email, this.username, this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class Errors {
  List<String>? email;
  List<String>? username;
  List<String>? phoneNumber;

  Errors({this.email, this.username, this.phoneNumber});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    username = json['username'].cast<String>();
    phoneNumber = json['phone_number'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
