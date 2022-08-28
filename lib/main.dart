import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'src/api/board_api.dart';
import 'src/repository/board_repository.dart';
import 'src/screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dio = Dio()
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BoardRepository(BoardApi(dio)),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }

  final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: '/:id',
        builder: (context, state) {
          final id = state.params['id'];
          if (id == null || id.isEmpty) {
            return const MainScreen();
          }

          return PlayScreen(id: id);
        },
      ),
    ],
  );
}
