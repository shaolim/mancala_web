import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/board.dart';

part 'board_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080")
abstract class BoardApi {
  factory BoardApi(Dio dio, {String baseUrl}) = _BoardApi;

  @POST("/boards")
  Future<Board> save();

  @GET("/boards/{id}")
  Future<Board> findById(@Path("id") id);

  @PUT("/boards/{id}")
  Future<Board> play(
    @Path("id") id,
    @Body() PlayRequest request,
  );
}
