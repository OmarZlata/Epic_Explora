import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
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
  void initState() {
    super.initState();
    initializeCubit();
  }

  void initializeCubit() async {
    final cubit = BlocProvider.of<GoogleMapsCubit>(context);
    final currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    cubit.setInitialMarker(
      LatLng(currentPosition.latitude, currentPosition.longitude),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
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
                        target: cubit.markers.isNotEmpty
                            ? cubit.markers.first.position
                            : LatLng(31.042313, 31.351994),
                        zoom: 15,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                    ),
                  ),
                  state is GoogleMapsLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                          ),
                        )
                      : Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                              border: Border.all(
                                  color: AppColors.blue.withOpacity(.15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Image.asset('assets/images/location.png'),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                title: "Current location",
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              cubit.markers.isEmpty
                                  ? AppButton(
                                      border_color: AppColors.white,
                                      color: AppColors.grey.withOpacity(.5),
                                      font_color: AppColors.white,
                                      title: "Set Your Location",
                                    )
                                  : AppButton(
                                      border_color: AppColors.blue,
                                      color: AppColors.blue,
                                      font_color: AppColors.white,
                                      title: "Set Your Location",
                                      onTap: cubit.markers.isEmpty
                                          ? null
                                          : cubit.getLocation,
                                    ),
                            ],
                          ),
                        )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
