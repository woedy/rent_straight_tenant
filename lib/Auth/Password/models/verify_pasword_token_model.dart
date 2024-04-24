class VerifyResetTokenModel {
  Errors? errors;
  String? message;

  VerifyResetTokenModel({ this.errors, this.message});

  VerifyResetTokenModel.fromJson(Map<String, dynamic> json) {
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

  List<String>? email;
  List<String>? token;

  Errors(
      {
        this.email,
        this.token});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    token = json['token'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
