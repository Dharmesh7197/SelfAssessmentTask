

import 'package:self_assesment_task/core/models/server_response.dart';

class EmptyResponse implements Serializable {

  EmptyResponse.fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

}