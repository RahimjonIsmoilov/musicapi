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
    super.initState();
    BlocProvider.of<MusicSearchBloc>(context).add(MusicLoadingDate());
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
                        image: NetworkImage(state.musicList[index].md5Image!)),
                  );
                },
              );
            }
            if (state is MusicError) {
              return const Center(
                child: Icon(
                  Icons.error,
                  size: 120,
                ),
              );
            }
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemBuilder: (context, index) {
                return Card();
              },
            );
          },
        ));
  }
}
