import 'dart:convert';

import 'package:http/http.dart' as http;

/// API client for Algolia.
class AlgoliaAPIClient extends http.BaseClient {
  final String appID;
  final String apiKey;
  final String indexName;
  final http.Client _client = http.Client();

  AlgoliaAPIClient(this.appID, this.apiKey, this.indexName);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['content-type'] = "application/json";
    request.headers['X-Algolia-API-Key'] = apiKey;
    request.headers['X-Algolia-Application-Id'] = appID;
    print(request);
    print(request.headers);
    return _client.send(request);
  }

  /// Run a search query and get a response.
  Future<Map<dynamic, dynamic>> search(String query) async {
    var url = Uri.https('$appID-dsn.algolia.net', '1/indexes/$indexName/query');
    final request = http.Request("post", url);
    request.body = '{"params": "query=$query"}';
    final streamedResponse = await send(request);
    final response = await http.Response.fromStream(streamedResponse);
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  }
}
