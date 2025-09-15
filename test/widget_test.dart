import 'package:flutter_test/flutter_test.dart';

import 'package:task_tracker/main.dart';

void main() {
  testWidgets('Task Tracker app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskTrackerApp());

    expect(find.text('Task Tracker - Naim Lindsay'), findsOneWidget);
    expect(find.text('Add a task…'), findsOneWidget);
  });
}
