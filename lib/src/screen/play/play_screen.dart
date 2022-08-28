import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/board_bloc.dart';
import '../../model/player_enum.dart';
import '../../repository/board_repository.dart';
import 'kalah.dart';
import 'pit.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({
    required this.id,
    Key? key,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoardBloc>(
      create: (context) {
        final repository = RepositoryProvider.of<BoardRepository>(context);
        return BoardBloc(repository)..add(Load(id));
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 240,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffffc18c),
              ),
              child: BlocBuilder<BoardBloc, BoardState>(
                builder: (context, state) {
                  if (state is BoardLoaded) {
                    final board = state.board;
                    final playerOne = board.playerOne;
                    final playerTwo = board.playerTwo;
                    final status = board.status;

                    if (status != "ACTIVE") {
                      return Container(
                          width: 240.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black,
                          ),
                          child: Column(
                            children: [
                              Text(
                                status.replaceAll("_", " "),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.go("/");
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  minimumSize: const Size(144.0, 80.0),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  primary: const Color(0xffDFD7C8),
                                  elevation: 1.0,
                                ),
                                child: Text(
                                  "PLAY AGAIN",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xffBA8C63),
                                      ),
                                ),
                              )
                            ],
                          ),
                        );
                    }

                    return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Player Two',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          board.nextPlayerEnum == PlayerEnum.two
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Kalah(stones: playerTwo.kalah.stones ?? 0),
                            ),
                            PitRow(
                              currentPlayer: board.nextPlayerEnum,
                              leftIndex: 0,
                              leftPit: playerOne.pits[0].stones ?? 0,
                              rightIndex: 5,
                              rightPit: playerTwo.pits[5].stones ?? 0,
                            ),
                            PitRow(
                              currentPlayer: board.nextPlayerEnum,
                              leftIndex: 1,
                              leftPit: playerOne.pits[1].stones ?? 0,
                              rightIndex: 4,
                              rightPit: playerTwo.pits[4].stones ?? 0,
                            ),
                            PitRow(
                              currentPlayer: board.nextPlayerEnum,
                              leftIndex: 2,
                              leftPit: playerOne.pits[2].stones ?? 0,
                              rightIndex: 3,
                              rightPit: playerTwo.pits[3].stones ?? 0,
                            ),
                            PitRow(
                              currentPlayer: board.nextPlayerEnum,
                              leftIndex: 3,
                              leftPit: playerOne.pits[3].stones ?? 0,
                              rightIndex: 2,
                              rightPit: playerTwo.pits[2].stones ?? 0,
                            ),
                            PitRow(
                              currentPlayer: board.nextPlayerEnum,
                              leftIndex: 4,
                              leftPit: playerOne.pits[4].stones ?? 0,
                              rightIndex: 1,
                              rightPit: playerTwo.pits[1].stones ?? 0,
                            ),
                            PitRow(
                              currentPlayer: board.nextPlayerEnum,
                              leftIndex: 5,
                              leftPit: playerOne.pits[5].stones ?? 0,
                              rightIndex: 0,
                              rightPit: playerTwo.pits[0].stones ?? 0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Kalah(stones: playerOne.kalah.stones ?? 0),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Player One',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          board.nextPlayerEnum == PlayerEnum.one
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                              ),
                            ),
                          ],
                        );
                  }

                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
