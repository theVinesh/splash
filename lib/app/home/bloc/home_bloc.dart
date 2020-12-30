import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:splash/app/home/bloc/home_event.dart';
import 'package:splash/app/home/bloc/home_state.dart';
import 'package:splash/app/home/repository/photos_repository.dart';
import 'package:splash/app/model/photo_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PhotosRepository repository;

  HomeBloc({@required this.repository})
      : assert(repository != null),
        super(Empty());



  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchPhotos) {
      yield Loading();
      try {
        final List<PhotoModel> photos = await repository.fetchPhotos();
        if (photos.isEmpty) {
          yield Empty();
        } else {
          yield Loaded(photos: photos);
        }
      } catch (e) {
        yield Error(message: e.toString());
      }
    }
  }
}
