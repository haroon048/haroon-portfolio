import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:haroon_portfolio/main.dart';

void main() {
  List<String> drainExceptions(WidgetTester tester) {
    final List<String> found = <String>[];
    dynamic exception = tester.takeException();
    while (exception != null) {
      found.add(exception.toString());
      exception = tester.takeException();
    }
    return found;
  }

  Future<List<String>> pumpAtSize(
    WidgetTester tester,
    Size size,
  ) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final List<String> errors = <String>[];
    await tester.pumpWidget(const HaroonPortfolioApp());
    errors.addAll(drainExceptions(tester));
    await tester.pump();
    errors.addAll(drainExceptions(tester));
    await tester.pump(const Duration(milliseconds: 300));
    errors.addAll(drainExceptions(tester));
    final Finder scrollable = find.byType(SingleChildScrollView).first;
    for (int i = 0; i < 14; i++) {
      await tester.drag(scrollable, const Offset(0, -600));
      await tester.pump(const Duration(milliseconds: 100));
      errors.addAll(drainExceptions(tester));
    }
    await tester.pump(const Duration(milliseconds: 300));
    errors.addAll(drainExceptions(tester));
    return errors;
  }

  List<String> overflowsOnly(List<String> errors) {
    return errors.where((String e) => e.contains('overflowed')).toList();
  }

  testWidgets('no RenderFlex overflow at desktop 1366x768', (
    WidgetTester tester,
  ) async {
    final List<String> errors = await pumpAtSize(
      tester,
      const Size(1366, 768),
    );
    final List<String> overflows = overflowsOnly(errors);
    expect(overflows, isEmpty, reason: overflows.join('\n---\n'));
  });

  testWidgets('no RenderFlex overflow at mobile 360x800', (
    WidgetTester tester,
  ) async {
    final List<String> errors = await pumpAtSize(
      tester,
      const Size(360, 800),
    );
    final List<String> overflows = overflowsOnly(errors);
    expect(overflows, isEmpty, reason: overflows.join('\n---\n'));
  });
}
