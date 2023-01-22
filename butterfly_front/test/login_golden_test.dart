import 'package:butterfly_front/presentation/ui/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

main() async {
  await loadAppFonts();
  testGoldens('login page should render same', (WidgetTester tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ],
      )
      ..addScenario(
        name: 'login page',
        widget: const Login(),
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'goldens/login');
  });
}
