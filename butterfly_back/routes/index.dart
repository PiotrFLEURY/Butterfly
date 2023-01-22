import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

class Greeting {
  Greeting(this.message);

  factory Greeting.fromJson(Map<String, dynamic> json) =>
      Greeting(json['message'] as String);

  final String message;

  Map<String, dynamic> toJson() => {'message': message};
}

final List<Greeting> greetings = [];

final _router = dslRouter<Greeting?, List<Greeting>>(
  {
    HttpMethod.post: (body) => onPost(body!),
    HttpMethod.get: (_) => onGet(),
    HttpMethod.delete: (body) => onDelete(body!),
  },
  parser: Greeting.fromJson,
);

Future<Response> onRequest(RequestContext context) async =>
    _router.handle(context);

// POST /
List<Greeting> onPost(Greeting greeting) {
  return greetings..add(greeting);
}

// GET /
List<Greeting> onGet() {
  return greetings;
}

// DELETE /
List<Greeting> onDelete(Greeting greeting) {
  return greetings..remove(greeting);
}

typedef RequestHandler<RequestBody, Resource> = Resource Function(
  RequestBody? request,
);

typedef JsonRequestParser = dynamic Function(Map<String, dynamic>);

DslRouter<RequestBody, Resource> dslRouter<RequestBody, Resource>(
  Map<HttpMethod, RequestHandler<RequestBody, Resource>> handlers, {
  JsonRequestParser? parser,
}) {
  return DslRouter<RequestBody, Resource>(handlers, jsonRequestParser: parser);
}

class DslRouter<RequestBody, Resource> {
  DslRouter(
    this._handlers, {
    this.jsonRequestParser,
  });

  final Map<HttpMethod, RequestHandler<RequestBody, Resource>> _handlers;
  final JsonRequestParser? jsonRequestParser;

  Future<Response> handle(RequestContext context) async {
    log(
      'Handling request: ${context.request.method} ${context.request.uri}',
    );
    final method = context.request.method;
    final handler = _handlers[method];
    if (handler == null) {
      return Response(
        statusCode: 405,
        body: 'Method not allowed',
      );
    }

    Resource? result;
    try {
      final body = await context.request.body();
      log('Body: [$body]');
      RequestBody? requestBody;
      if (body.isNotEmpty) {
        requestBody = jsonRequestParser
            ?.call(jsonDecode(body) as Map<String, dynamic>) as RequestBody;
      } else {
        log('Empty body');
      }
      result = handler(requestBody);
    } catch (e) {
      log('Error: $e');
      return Response(
        statusCode: 500,
        body: 'Internal server error',
      );
    }

    log('Result: $result');

    switch (method) {
      case HttpMethod.post:
        return Response(
          statusCode: 201,
          body: jsonEncode(result),
        );
      case HttpMethod.get:
        final empty = result == null || result is List && result.isEmpty;
        log('Empty: $empty');
        return Response(
          headers: {
            'Content-Type': 'application/json',
          },
          statusCode: empty ? 204 : 200,
          body: empty ? '[]' : jsonEncode(result),
        );
      case HttpMethod.put:
        return Response(
          body: jsonEncode(result),
        );
      case HttpMethod.delete:
        return Response(
          statusCode: 202,
        );
      case HttpMethod.patch:
      case HttpMethod.options:
      case HttpMethod.head:
        return Response(
          statusCode: 405,
          body: 'Method not allowed',
        );
    }
  }
}

void log(dynamic data) {
  if (kDebugMode) {
    // ignore: avoid_print
    print(data);
  }
}

const bool kDebugMode = !bool.fromEnvironment('dart.vm.product');
