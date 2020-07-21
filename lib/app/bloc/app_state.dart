import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:splash/app/model/photo_model.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class Empty extends AppState {}

class Loading extends AppState {}

class Loaded extends AppState {
  final List<PhotoModel> photos;

  const Loaded({@required this.photos}) : assert(photos != null);

  @override
  List<Object> get props => [photos];
}

class Error extends AppState {
  final String message;

  const Error({@required this.message}) : assert(message != null);

  @override
  List<Object> get props => [message];
}
