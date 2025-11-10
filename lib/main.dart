import 'package:education_platform_app/export.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  await _initializeServices();

  // Debug log
  Log.demo();

  // Determine the initial route based on login state
  final initialRoute = getInitialRouteBasedOnLogin();

  runApp(EducationPlatformApp(initialRoute: initialRoute));
}

Future<void> _initializeServices() async {
  await setupGetIt();
  await SharedPrefsService.init();
}
