import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class FetchPhotos extends AppEvent {
  const FetchPhotos();

  @override
  List<Object> get props => [];
}
