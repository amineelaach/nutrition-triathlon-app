import 'package:flutter_test/flutter_test.dart';
import 'package:ramadanfit/app.dart';

void main() {
  testWidgets('RamadanFit app starts and shows first tab', (tester) async {
    await tester.pumpWidget(const RamadanFitApp());

    expect(find.text('Plan repas'), findsOneWidget);
    expect(find.text('Plan repas Ramadan'), findsOneWidget);
  });
}
