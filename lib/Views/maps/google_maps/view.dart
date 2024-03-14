import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/location_utils/location_utils.dart';
import 'cubit.dart';


class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPosition = LocationUtils.currentPosition;
    return BlocProvider(
      create: (context) => GoogleMapsCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<GoogleMapsCubit, GoogleMapsStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<GoogleMapsCubit>(context);
            final weather = cubit.weather;
            if (weather != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(weather.condition),
                  Text(weather.district),
                  Text(weather.region),
                  Text(weather.country),
                  Text(weather.temp.toString()),
                  Text(weather.windSpeed.toString()),
                  Text(weather.time),
                  Text(weather.timezone),
                  ElevatedButton(
                    onPressed: cubit.reset,
                    child: Text('Re-pick location'),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GoogleMap(
                    markers: cubit.markers,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    onTap: cubit.selectMarker,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        currentPosition?.latitude ?? 31,
                        currentPosition?.longitude ?? 31,
                      ),
                      zoom: currentPosition == null ? 0.0 : 16,
                    ),
                  ),
                ),
                state is GoogleMapsLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed:
                            cubit.markers.isEmpty ? null : cubit.getWeather,
                        child: Text('Confirm'),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
