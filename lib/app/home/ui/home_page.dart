import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:splash/app/home/bloc/home_bloc.dart';
import 'package:splash/app/home/bloc/home_event.dart';
import 'package:splash/app/home/bloc/home_state.dart';
import 'package:splash/app/home/repository/photos_repository.dart';
import 'package:splash/app/home/ui/photo.dart';

class HomePage extends StatelessWidget {
  final PhotosRepository repository;

  const HomePage({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: BlocProvider(
        create: (_) => HomeBloc(repository: repository),
        child: Scaffold(
          body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
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

            return _buildError(state, context);
          }),
        ),
      ),
    );
  }

  Widget _buildError(HomeState state, BuildContext context) {
    final message = (state is Error) ? state.message : "Empty";
    final actionText = (state is Error) ? "Try Again" : "Fetch New Photos";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text(actionText),
            onPressed: () => _refreshData(context),
          )
        ],
      ),
    );
  }

  Future<void> _refreshData(BuildContext context) async {
    BlocProvider.of<HomeBloc>(context).add(FetchPhotos());
  }
}
