import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ArticlesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Articles',
      apiUrl: 'https://api.intercom.io/articles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer dG9rOjQwNmNhZDRlXzA0YjlfNGYyOV9iZGI3X2VmNDAyOWMxNDY5MjoxOjA=',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic articleTitle(dynamic response) => getJsonField(
        response,
        r'''$.data.title''',
        true,
      );
}

class CollectionsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Collections',
      apiUrl: 'https://api.intercom.io/help_center/collections',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer dG9rOmQyNzM5MjliXzc0NjVfNGVkOV9iZDUyXzA1Y2M4ZmI1MTUyYToxOjA=',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
    );
  }
}

class ConversationCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'conversation',
      apiUrl: 'https://api.intercom.io/conversations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer dG9rOmQyNzM5MjliXzc0NjVfNGVkOV9iZDUyXzA1Y2M4ZmI1MTUyYToxOjA=',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
