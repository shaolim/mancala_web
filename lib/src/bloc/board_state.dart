part of 'board_bloc.dart';

abstract class BoardState extends Equatable {
  const BoardState();
}

class BoardInitial extends BoardState {
  const BoardInitial();

  @override
  List<Object?> get props => [];
}

class BoardLoading extends BoardState {
  const BoardLoading();

  @override
  List<Object?> get props => [];
}

class BoardLoaded extends BoardState {
  const BoardLoaded(this.board);

  final Board board;

  @override
  List<Object?> get props => [board];
}

class BoardError extends BoardState {
  const BoardError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
