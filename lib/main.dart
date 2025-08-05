import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mindkraft/core/utils/naviagtion_helper.dart';
import 'package:mindkraft/features/auth/presentation/views/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mindkraft/shared/widgets/bottom_navigation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'core/theme/appTheme.dart';
import 'features/uploadFile/presentation/views/file_upload_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await initializeParse();
  // print('After Parse init');
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fa'), Locale('de')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: Phoenix(child: MyApp()),
    ),
  );
}

Future<void> initializeParse() async {
  const keyApplicationId = 'IuCUBOsuR3sYrOzuWzw0UAJXIorbSTOwsDmlQdA0';
  const keyClientKey = 'v2SsGhMQAGq8psGQ6ne0D7Ep33UJgam2viMx0zNZ';
  const keyParseServerUrl = 'https://parseapi.back4app.com/';

  try {
    await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, debug: true);
  } catch (e, st) {
    print('Parse init error: $e');
    print(st);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Kraft',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.getLightTheme(),
      // darkTheme: AppTheme.getDarkTheme(),
      // themeMode: ThemeMode.system,
      home: SessionChecker(secureStorage: _secureStorage),
    );
  }
}


class SessionChecker extends StatefulWidget {
  final FlutterSecureStorage secureStorage;

  const SessionChecker({super.key, required this.secureStorage});

  @override
  State<SessionChecker> createState() => _SessionCheckerState();
}

class _SessionCheckerState extends State<SessionChecker> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final sessionToken = await widget.secureStorage.read(key: 'accessToken');

    if (sessionToken == null) {
      // برو به صفحه اصلی
    navigateWithFade(context,  SplashScreen());
    } else {
      // برو صفحه لاگین یا اسپلش
   navigateWithFade(context,  MainScreen(key: mainScreenKey));
    }
  }

  @override
  Widget build(BuildContext context) {
    // یه صفحه‌ی خالی یا لودینگ موقتی نشون بده تا مسیر مشخص بشه
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
