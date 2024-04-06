import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Widgets/bottomNavigationBar.dart';
import '../../../core/Location_utlis/location_utils.dart';
import 'cubit.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    final currentPosition = LocationUtils.currentPosition;
    return BlocProvider(
      create: (context) => GoogleMapsCubit(),
      child: Scaffold(
        body: BlocBuilder<GoogleMapsCubit, GoogleMapsStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<GoogleMapsCubit>(context);
            final location = cubit.location;
            if (location != null) {
              return bottomNavigationBar();
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
                        currentPosition?.latitude ?? 31.042313,
                        currentPosition?.longitude ?? 31.351994,
                      ),
                      zoom: 15,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                ),
                state is GoogleMapsLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                  style: ButtonStyle(),
                        onPressed:
                            cubit.markers.isEmpty ? null : cubit.getLocation,
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
