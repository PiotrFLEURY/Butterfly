import 'dart:io';

import 'package:butterfly_models/butterfly_models.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/conversations/index.dart' as route;
import '../data/examples.dart';

class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

void main() {
  group('GET /conversations', () {
    test('responds with a 200 and Conversations summary', () {
      final context = _MockRequestContext();
      final request = _MockRequest();

      when(() => context.request).thenReturn(request);

      when(() => request.uri).thenReturn(
        Uri.parse('http://localhost:8080/conversations?chatGroup=Work'),
      );

      when(() => context.read<List<ChatGroup>>()).thenReturn([
        aChatGroup(named: 'Work'),
      ]);
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(
        response.body(),
        completion(
          equals(
            '[{"id":"1","messagesCount":1,"participants":["Dart Frog"]}]',
          ),
        ),
      );
    });
  });
}
