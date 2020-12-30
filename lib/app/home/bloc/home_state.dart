import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:splash/app/model/photo_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class Empty extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<PhotoModel> photos;

  const Loaded({@required this.photos}) : assert(photos != null);

  @override
  List<Object> get props => [photos];
}

class Error extends HomeState {
  final String message;

  const Error({@required this.message}) : assert(message != null);

  @override
  List<Object> get props => [message];
}
