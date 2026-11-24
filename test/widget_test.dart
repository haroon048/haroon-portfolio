import 'package:flutter_test/flutter_test.dart';
import 'package:haroon_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app builds and shows the hero', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HaroonPortfolioApp());
    await tester.pump(const Duration(seconds: 3));
    expect(find.text("Hi, I'm "), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
  });
}
