part of 'board_bloc.dart';

abstract class BoardEvent extends Equatable {
  const BoardEvent();
}

class Create extends BoardEvent {
  const Create();

  @override
  List<Object?> get props => [];
}

class Load extends BoardEvent {
  const Load(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

class Play extends BoardEvent {
  const Play({
    required this.id,
    required this.player,
    required this.pitIndex,
  });

  final String id;
  final PlayerEnum player;
  final int pitIndex;

  @override
  List<Object?> get props => [
        id,
        player,
        pitIndex,
      ];
}
