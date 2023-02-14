class LoginResponse {
  String? status;
  String? code;
  String? token;

  LoginResponse({this.status, this.code, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['token'] = token;
    return data;
  }
}
