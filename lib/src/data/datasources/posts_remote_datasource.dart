import 'dart:convert';

import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/core/network/dio_client.dart';
import 'package:challenge_channels/src/core/utils/global_vars.dart';
import 'package:challenge_channels/src/data/dtos/comment_dto.dart';
import 'package:challenge_channels/src/data/dtos/post_dto.dart';

abstract class PostsRemoteDatasource {
  Future<List<PostDto>> getPosts();

  Future<List<CommentDto>> getComments({required int idPost});
}

class PostsRemoteDatasourceImpl extends PostsRemoteDatasource {
  final dioClient = DioClient();

  @override
  Future<List<CommentDto>> getComments({required int idPost}) async {
    final url = '${Globalvars.postsEnpoint}/$idPost${Globalvars.commentsPostEnpoint}';
    logDev.i('COMMENTS  >>>  ${url}');
    final response = await dioClient.getDio(url: url);
    logDev.i('COMMENTS  >>>  ${response.data.toString()}');
    final list = response.data as List;
    return list.map((e) => CommentDto.fromJson(e)).toList();
  }

  @override
  Future<List<PostDto>> getPosts() async {
    final url = Globalvars.postsEnpoint;
    final response = await dioClient.getDio(url: url);
    logDev.i('POSTS >>> ${response.data.toString()}');
    final list = response.data as List;
    return list.map((e) => PostDto.fromJson(e as Map<String, dynamic>)).toList();
  }
}
