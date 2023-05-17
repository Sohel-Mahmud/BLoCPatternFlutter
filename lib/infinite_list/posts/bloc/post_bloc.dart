/*
 * File: post_bloc.dart
 * Project: bloc
 * File Created: Friday, 12th May 2023 9:51:42 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Friday, 12th May 2023 9:51:42 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'dart:async';

import 'package:blocpattern/infinite_list/posts/bloc/post_event.dart';
import 'package:blocpattern/infinite_list/posts/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    /// droppable - ignore any events added while an event is processing
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(
      _onPostFetched,

      /// [EventTransformer] to customize how events are processed.
      /// in this case we throttled for 100ms between consecutive events, debounce
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();

        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasReachedMax: false,
        ));
      }

      final posts = await _fetchPosts(state.posts.length);
      emit(posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false,
            ));

    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
