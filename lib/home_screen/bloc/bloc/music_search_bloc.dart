
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:musicapi/home_screen/api/music_model.dart';
import 'package:musicapi/home_screen/api/music_repository.dart';

part 'music_search_event.dart';
part 'music_search_state.dart';

class MusicSearchBloc extends Bloc<MusicSearchEvent, MusicSearchState> {
  MusicSearchBloc() : super(MusicSearchInitial()) {
    on<MusicSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MusicLoadingDate>((event, emit) async {
      emit(MusicLoading());
      try {
        final dynamic result = await MusicRepostory().getData();
        if (result != []) {
          emit(MusicSucces(musicList: result));
        } else {
          emit(MusicError());
        }
      } catch (e) {
        emit(MusicError());
      }
    });
  }
}
