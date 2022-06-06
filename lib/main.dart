import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';

import 'logic/cubit/counter_cubit.dart';
import 'presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  Connectivity connectivity;
  MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        onGenerateRoute: appRouter.onGenratedRoute,
      ),
    );
  }
}
