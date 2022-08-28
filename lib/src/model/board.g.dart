// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayRequest _$PlayRequestFromJson(Map<String, dynamic> json) => PlayRequest(
      player: json['player'] as String,
      pitIndex: json['pitIndex'] as int,
    );

Map<String, dynamic> _$PlayRequestToJson(PlayRequest instance) =>
    <String, dynamic>{
      'player': instance.player,
      'pitIndex': instance.pitIndex,
    };

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      id: json['id'] as String,
      playerOne: Player.fromJson(json['playerOne'] as Map<String, dynamic>),
      playerTwo: Player.fromJson(json['playerTwo'] as Map<String, dynamic>),
      nextPlayer: json['nextPlayer'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'playerOne': instance.playerOne,
      'playerTwo': instance.playerTwo,
      'nextPlayer': instance.nextPlayer,
      'status': instance.status,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      kalah: Pit.fromJson(json['kalah'] as Map<String, dynamic>),
      pits: (json['pits'] as List<dynamic>)
          .map((e) => Pit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'kalah': instance.kalah,
      'pits': instance.pits,
    };

Pit _$PitFromJson(Map<String, dynamic> json) => Pit(
      stones: json['stones'] as int?,
    );

Map<String, dynamic> _$PitToJson(Pit instance) => <String, dynamic>{
      'stones': instance.stones,
    };
