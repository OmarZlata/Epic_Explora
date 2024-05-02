import 'package:bloc/bloc.dart';
import 'package:graduation_project/Views/Place_Detials/place_details/repo.dart';

import 'package:graduation_project/Views/Place_Detials/place_details/state.dart';


class DataCubit extends Bloc<DataCubit,DataState> {
  final DataRepository _dataRepository;

  DataCubit(this._dataRepository) : super(DataInitial());

  Future<void> getPlaceDetails(int placeId) async {
    emit(DataLoading());
    try {
      final place = await _dataRepository.fetchData();
      emit(DataLoaded(place));
    } catch (e) {
      emit(DataError('Failed to fetch place details: $e'));
    }
  }
}
