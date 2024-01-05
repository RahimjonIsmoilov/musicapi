part of 'music_search_bloc.dart';

@immutable
abstract class MusicSearchState {}

final class MusicSearchInitial extends MusicSearchState {}

class MusicLoading extends MusicSearchState {}

// ignore: must_be_immutable
class MusicSucces extends MusicSearchState {
  List<MusicSearch> musicList;
  MusicSucces({required this.musicList});
}

class MusicError extends MusicSearchState {}
