
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/app_bar.dart';
import '../../../Widgets/app_card.dart';
import 'cubit.dart';
import 'favourite_repo.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit(
        HotelRepository(),
      ),
      child: Scaffold(
        appBar: AppAppBar(title: "Favorite"),
        body: ListView.builder(
          itemBuilder: (context, index) {
            AppCard();
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
