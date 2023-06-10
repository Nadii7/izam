import 'package:izam/core/utils/constants/app_strings.dart';

import 'core/config/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/config/routes/routes.dart';
import 'package:provider/provider.dart';
import 'app/data/database/init_database.dart';
import 'app/domain/usecase/user_usecase.dart';
import 'app/data/repository/user_repository_impl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await initDatabase();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        Provider<UserUseCase>(
          create: (_) => UserUseCase(UserRepositoryImpl(database)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          routes: routes,
          initialRoute: '/',
          title: AppStrings.appName,
          theme: defaultThemeData(context),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
