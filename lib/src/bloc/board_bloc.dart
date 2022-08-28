import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/board.dart';
import '../model/player_enum.dart';
import '../repository/board_repository.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc(this._repository) : super(const BoardInitial()) {
    on<Create>(_onCreate);
    on<Load>(_onLoad);
    on<Play>(_onPlay);
  }

  final BoardRepository _repository;

  Future<void> _onCreate(Create event, Emitter<BoardState> emitter) async {
    try {
      final result = await _repository.create();
      emitter(BoardLoaded(result));
    } on DioError catch (e) {
      final errorResponse = e.response;
      if (errorResponse == null) {
        emitter(BoardError(errorResponse?.data['message'] ?? 'unknown error'));
      } else {
        emitter(const BoardError('unknown error'));
      }
    }
  }

  Future<void> _onLoad(Load event, Emitter<BoardState> emitter) async {
    try {
      final result = await _repository.findById(event.id);
      emitter(BoardLoaded(result));
    } on DioError catch (e) {
      final errorResponse = e.response;
      if (errorResponse == null) {
        emitter(BoardError(errorResponse?.data['message'] ?? 'unknown error'));
      } else {
        emitter(const BoardError('unknown error'));
      }
    }
  }

  Future<void> _onPlay(Play event, Emitter<BoardState> emitter) async {
    final request = PlayRequest(
      player: event.player.toRequest(),
      pitIndex: event.pitIndex,
    );

    try {
      final result = await _repository.play(event.id, request);
      emitter(BoardLoaded(result));
    } on DioError catch (e) {
      final errorResponse = e.response;
      if (errorResponse == null) {
        emitter(BoardError(errorResponse?.data['message'] ?? 'unknown error'));
      } else {
        emitter(const BoardError('unknown error'));
      }
    }
  }
}
