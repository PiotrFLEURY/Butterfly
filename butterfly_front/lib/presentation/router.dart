import 'package:butterfly_front/presentation/ui/contacts/contacts.dart';
import 'package:butterfly_front/presentation/ui/conversation/conversation_page.dart';
import 'package:butterfly_front/presentation/ui/error/error.dart';
import 'package:butterfly_front/presentation/ui/login/login.dart';
import 'package:butterfly_front/presentation/ui/splash/splash.dart';

import 'package:go_router/go_router.dart';

bool connected = false;

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        return connected ? '/contacts' : '/login';
      },
      builder: (context, state) => const Splash(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => const Contacts(),
      routes: [
        GoRoute(
          path: 'conversation/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return ConversationPage(id: id);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Error(message: state.error),
);
