import 'package:self_assesment_task/core/models/server_response.dart';

class ListServerResponse<T extends Serializable> {
  int? status;
  String? message;
  List<T>? data;

  ListServerResponse({this.status, this.message, this.data});

  factory ListServerResponse.fromJson(Map<String, dynamic> json, Function(List<dynamic>) create) {
    return ListServerResponse<T>(
      status: json["status"],
      message: json["message"],
      data: create(json["data"] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": this.status,
        "message": this.message,
        "data": this.data!.map((v) => v.toJson()).toList(),
      };
}
