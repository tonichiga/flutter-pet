import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/search/search_event.dart';
import 'package:my_app/bloc/search/search_state.dart';
import 'package:stream_transform/stream_transform.dart';

// Debounce
EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchUserEvent>(_onSearch,
        transformer: debounceDroppable(const Duration(milliseconds: 300)));
  }

  _onSearch(SearchUserEvent event, Emitter<SearchState> emit) async {
    if (event.query.length < 3) return;

    final res = await _httpClient.get(apiUrl, queryParameters: {
      "q": event.query,
    });

    emit(SearchState(users: res.data['data']));
  }
}
