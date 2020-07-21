import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/app/bloc/app_bloc.dart';
import 'package:splash/app/bloc/app_event.dart';
import 'package:splash/app/bloc/app_state.dart';
import 'package:splash/app/home/photo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppBloc, AppState>(builder: (_, state) {
        if (state is Empty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Empty'),
                RaisedButton(
                  child: Text("Fetch new photos"),
                  onPressed: () => _refreshData(context),
                )
              ],
            ),
          );
        }
        if (state is Error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error : ${state.message}'),
                RaisedButton(
                  child: Text("Try again"),
                  onPressed: () => _refreshData(context),
                )
              ],
            ),
          );
        }
        if (state is Loaded) {
          final photos = state.photos;
          return RefreshIndicator(
            onRefresh: () => _refreshData(context),
            child: ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) => Photo(
                photo: photos[index],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Future<void> _refreshData(BuildContext context) async {
    BlocProvider.of<AppBloc>(context).add(FetchPhotos());
  }
}
