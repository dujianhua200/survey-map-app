import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_map_app/app.dart';
import 'package:survey_map_app/data/models/database.dart';
import 'package:survey_map_app/core/storage/path_resolver.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SurveyMapApp(
      database: AppDatabase.forTesting(AppDatabase().connection),
      pathResolver: PathResolver(),
    ));
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
