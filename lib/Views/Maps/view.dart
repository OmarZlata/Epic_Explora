import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../Widgets/app_button.dart';
import '../../Widgets/bottomNavigationBar.dart';
import '../../core/models/location.dart';
import '../MainScreens/home_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'cubit.dart';

class SelectLocation extends StatelessWidget {

  const SelectLocation({super.key});

  @override
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Column(
                children: [
                  SizedBox(height:16 ,),
                  Image.asset('assets/images/Group 101.png'),
                  SizedBox(height:22 ,),
                  Image.asset('assets/images/location.png'),
                  SizedBox(height:8 ,),
                  Text("Current location",style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height:8 ,),
                  Text("Location code",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      )),
                  SizedBox(height: 25,),
                  AppButton(
                    title: "set my location",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottomNavigationBar(),));
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentWeather(),
      child: Scaffold(
        backgroundColor: AppColors.gray,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Select Location",
            style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<HomeCubit>(context);
            if (state is HomeLoading) {
              return  Center(
                child: CircularProgressIndicator(),
              );
            }
            final location = cubit.location;
            if (location == null) {
              return Center(child: Text('Something went wrong!'));
            }
            return Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(location.condition),
                      Text(location.district),
                      Text(location.region),
                      Text(location.country),
                      Text(location.temp.toString()),
                      Text(location.windSpeed.toString()),
                      Text(location.time),
                      Text(location.timezone),
                    ],
                  ),
                ),
                Center(
                  child: AppButton(
                    title: "Select Location",
                    color: AppColors.blue,
                    font_color: AppColors.white,
                    onTap: () {
                      _showBottomSheet(context);
                    },
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}

//
// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//
//   return await Geolocator.getCurrentPosition();
// }
//
// Location? location;
// Future<void> getCurrentLocation() async {
//   final position = LocationUtils.currentPosition;
//   if (position == null) {
//     return;
//   }
//   try {
//     final baseURL = 'http://api.weatherapi.com/v1/current.json';
//     final params = '?q=${position.latitude}, ${position.longitude}';
//     final apiKey = '&key=58a1c88372354d15bf0115542241403';
//     final response = await Dio().get(baseURL + params + apiKey);
//     location = Location.fromJson(response.data);
//   } catch (e) {
//     print(e);
//   }
// }