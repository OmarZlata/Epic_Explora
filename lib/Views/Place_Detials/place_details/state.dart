import 'details_model.dart';

abstract class DataState {
  const DataState();
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final Place place;

  const DataLoaded(this.place);
}

class DataError extends DataState {
  final String errorMessage;

  const DataError(this.errorMessage);
}
