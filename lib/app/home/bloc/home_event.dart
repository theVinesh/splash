import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchPhotos extends HomeEvent {
  const FetchPhotos();

  @override
  List<Object> get props => [];
}
