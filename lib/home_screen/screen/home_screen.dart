import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musicapi/home_screen/bloc/bloc/music_search_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<MusicSearchBloc>(context).add(MusicLoadingDate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 360,
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Qidiruv',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<MusicSearchBloc, MusicSearchState>(
          builder: (context, state) {
            if (state is MusicSucces) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: state.musicList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image(
                      image: NetworkImage(
                          state.musicList[index].artist?.picture ?? ''),
                      width: 30,
                      height: 30,
                    ),
                  );
                },
              );
            } else if (state is MusicError) {
              return Column(
                children: [
                  const Icon(
                    Icons.error,
                    size: 120,
                  ),
                  Text(state.message ?? "Error"),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // return GridView.builder(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            //   itemBuilder: (context, index) {
            //     return Card();
            //   },
            // );
          },
        ));
  }
}
