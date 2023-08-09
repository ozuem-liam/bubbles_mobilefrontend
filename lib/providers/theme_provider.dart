import 'package:bubbles/style/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeDataProvider = ChangeNotifierProvider<ThemeProvider>(
    (ref) => ThemeProvider());
