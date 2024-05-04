import 'package:bloc/bloc.dart';


import '../../../core/models/hotel.dart';
import 'favourite_repo.dart';


// Define the states for the Cubit
abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final List<Hotel> hotels;

  HotelLoaded(this.hotels);
}

class HotelError extends HotelState {
  final String message;

  HotelError(this.message);
}

// Define the events for the Cubit
enum PlaceEvent { fetchPlaces }

// Define the Cubit
class HotelCubit extends Cubit<HotelState> {
  final HotelRepository _repository;

  HotelCubit(this._repository) : super(HotelInitial());

  // Define the method to handle events
  Future<void> fetchPlaces() async {
    emit(HotelLoading());
    try {
      List<Hotel> hotels = await _repository.fetchHotels();
      emit(HotelLoaded(hotels));
    } catch (error) {
      emit(HotelError('Failed to fetch places: $error'));
    }
  }
}
