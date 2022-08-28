import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'player_enum.dart';

part 'board.g.dart';

@JsonSerializable()
class PlayRequest extends Equatable {
  final String player;
  final int pitIndex;

  const PlayRequest({
    required this.player,
    required this.pitIndex,
  });

  Map<String, dynamic> toJson() => _$PlayRequestToJson(this);

  @override
  List<Object?> get props => [
        player,
        pitIndex,
      ];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class Board extends Equatable {
  final String id;
  final Player playerOne;
  final Player playerTwo;
  final String nextPlayer;
  final String status;

  const Board({
    required this.id,
    required this.playerOne,
    required this.playerTwo,
    required this.nextPlayer,
    required this.status,
  });

  PlayerEnum get nextPlayerEnum {
    if (nextPlayer == "ONE") {
      return PlayerEnum.one;
    }

    return PlayerEnum.two;
  }

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  @override
  List<Object?> get props => [
        id,
        playerOne,
        playerTwo,
        nextPlayer,
        status,
      ];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class Player extends Equatable {
  final Pit kalah;
  final List<Pit> pits;

  const Player({
    required this.kalah,
    required this.pits,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  @override
  List<Object?> get props => [
        kalah,
        pits,
      ];

  @override
  bool? get stringify => true;
}

@JsonSerializable()
class Pit extends Equatable {
  final int? stones;

  const Pit({this.stones});

  factory Pit.fromJson(Map<String, dynamic> json) => _$PitFromJson(json);

  @override
  List<Object?> get props => [stones];

  @override
  bool? get stringify => true;
}
