class ServerResponse<T extends Serializable> {

  int? status;
  String? message;
  T? data;

  ServerResponse({this.status, this.message, this.data});

  factory ServerResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ServerResponse<T>(
      status: json["status"],
      message: json["message"],
      data: create(json["data"] ?? <String,dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": this.status,
    "message": this.message,
    "data": this.data?.toJson(),
  };

}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
