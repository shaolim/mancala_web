import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/board_bloc.dart';
import '../../repository/board_repository.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoardBloc>(
      create: (context) {
        final repository = RepositoryProvider.of<BoardRepository>(context);
        return BoardBloc(repository);
      },
      child: BlocConsumer<BoardBloc, BoardState>(
        listener: (context, state) {
          if (state is BoardLoaded) {
            final board = state.board;
            final id = board.id;
            context.go('/$id');
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<BoardBloc>().add(const Create());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  minimumSize: const Size(144.0, 80.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  primary: const Color(0xffffc18c),
                  elevation: 1.0,
                ),
                child: Text(
                  "PLAY",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
