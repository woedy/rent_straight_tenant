class VerifyEmailModel {
  Errors? errors;
  String? message;

  VerifyEmailModel({this.errors, this.message});

  VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}


class Errors {
  List<String>? token;


  Errors({this.token,});

  Errors.fromJson(Map<String, dynamic> json) {
    token = json['token'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
