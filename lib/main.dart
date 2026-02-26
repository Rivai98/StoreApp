import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/routing/app_routes.dart';
import 'package:store_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:store_app/features/home/presentation/view_model/product_cubit/product_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_page.dart';
import 'package:store_app/features/auth/presentation/views/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(Dio())),
        BlocProvider(
          create: (context) {
            final cubit = ProductCubit(Dio());
            cubit.loadProducts();
            return cubit;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

        initialRoute: token != null
            ? AppRoutes.homeRoute
            : AppRoutes.loginRoute,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
