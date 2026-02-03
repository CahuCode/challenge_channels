import 'package:challenge_channels/src/aplication/routes/app_routes.dart';
import 'package:challenge_channels/src/aplication/theme/themes_app.dart';
import 'package:challenge_channels/src/core/db/objectbox_app.dart';
import 'package:challenge_channels/src/core/di/di.dart';
import 'package:challenge_channels/src/presentation/state_manager/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  await ObjectboxApp.create();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeApp);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Challenge',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es')],
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemesApp.themeBaseLigth,
      darkTheme: ThemesApp.themeBaseDark,
      routerConfig: appRouter,
    );
  }
}
