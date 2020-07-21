import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:splash/app/bloc/app_event.dart';
import 'package:splash/app/bloc/app_state.dart';
import 'package:splash/app/model/photo_model.dart';
import 'package:splash/app/photo_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final PhotoRepository repository;

  AppBloc({@required this.repository}) : assert(repository != null);

  @override
  AppState get initialState => Empty();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
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
