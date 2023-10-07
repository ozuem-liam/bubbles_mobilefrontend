import 'package:bubbles/providers/providers.dart';
import 'package:bubbles/services/overlay_service.dart';
import 'package:bubbles/widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/providers/theme_provider.dart';
import 'package:bubbles/utils/temporary_storage.dart';
import 'package:bubbles/onboarding/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageManager.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarBrightness: Brightness.dark,
  // ));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeDataMode = ref.watch(themeDataProvider);
    ref.listen(loadingState.select((value) => value), (
      previous,
      current,
    ) {
      if (current) {
        OverlayService.showOverlay(context);
      } else {
        OverlayService.hideOverlay(context);
      }
    });
    return ScreenUtilInit(
        designSize: const Size(360, 700),
        builder: (widget, child) => GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: LoadingOverlayWidget(
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle(
                      statusBarBrightness: themeDataMode.isdarkTheme!
                          ? Brightness.dark
                          : Brightness.light,
                      statusBarIconBrightness: themeDataMode.isdarkTheme!
                          ? Brightness.light
                          : Brightness.dark,
                      statusBarColor: Colors.transparent),
                  child: GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'bubbles',
                    darkTheme: themeDataMode.isdarkTheme!
                        ? themeDataMode.darkTheme
                        : themeDataMode.lightTheme,
                    themeMode: ThemeMode.system,
                    theme: themeDataMode.isdarkTheme!
                        ? themeDataMode.darkTheme
                        : themeDataMode.lightTheme,
                    home: const SplashView(),
                  ),
                ),
              ),
            ));
  }
}
