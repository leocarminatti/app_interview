import 'package:app_interview/core/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_interview/main.dart' as app;

import 'route_test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AppRouter router;
  setUp(() {
    router = AppRouter();
  });

  group('Main Page', () {
    testWidgets('Click and button search and open SearchBox widget',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      await pumpRouterApp(tester, router);
      router.navigate(MainRoute());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('searchButtonOpen')));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('searchBoxKey')), findsOneWidget);
    });

    testWidgets('Load users succes', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await pumpRouterApp(tester, router);
      router.navigate(MainRoute());
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('listUsers')), findsOneWidget);
    });
  });
}
