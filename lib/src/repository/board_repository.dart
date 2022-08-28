import '../api/board_api.dart';
import '../model/board.dart';

class BoardRepository {
  const BoardRepository(this._api);

  final BoardApi _api;

  Future<Board> create() {
    return _api.save();
  }

  Future<Board> play(String id, PlayRequest request) {
    return _api.play(id, request);
  }

  Future<Board> findById(String id) {
    return _api.findById(id);
  }
}
