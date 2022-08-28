import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/board_bloc.dart';
import '../../model/player_enum.dart';

class PitRow extends StatelessWidget {
  const PitRow({
    required this.currentPlayer,
    required this.leftIndex,
    required this.leftPit,
    required this.rightIndex,
    required this.rightPit,
    Key? key,
  }) : super(key: key);

  final PlayerEnum currentPlayer;
  final int leftIndex;
  final int leftPit;
  final int rightIndex;
  final int rightPit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardBloc, BoardState>(
      builder: (context, state) {
        if (state is BoardLoaded) {
          final board = state.board;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Pit(
                  owner: PlayerEnum.one,
                  stones: leftPit,
                  turn: currentPlayer,
                  onTap: currentPlayer == PlayerEnum.one
                      ? () {
                          context.read<BoardBloc>().add(
                                Play(
                                  id: board.id,
                                  player: PlayerEnum.one,
                                  pitIndex: leftIndex,
                                ),
                              );
                        }
                      : null,
                ),
                Pit(
                  owner: PlayerEnum.two,
                  stones: rightPit,
                  turn: currentPlayer,
                  onTap: currentPlayer == PlayerEnum.two
                      ? () {
                          context.read<BoardBloc>().add(
                                Play(
                                  id: board.id,
                                  player: PlayerEnum.two,
                                  pitIndex: rightIndex,
                                ),
                              );
                        }
                      : null,
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}

class Pit extends StatelessWidget {
  const Pit({
    required this.stones,
    required this.owner,
    required this.turn,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int stones;
  final PlayerEnum owner;
  final PlayerEnum turn;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: owner == turn ? Colors.white : const Color(0xff563232),
            width: owner == turn ? 2 : 0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(60)),
        ),
        child: Center(
          child: Text(
            "$stones",
          ),
        ),
      ),
    );
  }
}
