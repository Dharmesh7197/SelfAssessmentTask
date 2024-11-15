abstract class RootService {
  Future<dynamic> getResponse(String url);
  Future<dynamic> getResponseWithQuery(String url,dynamic request);

  Future<dynamic> postResponse(String url, dynamic request);

  Future<dynamic> dynamicGetResponse(String url, dynamic headers);

  Future<dynamic> dynamicPostResponse(String url, dynamic request, dynamic headers);
}
