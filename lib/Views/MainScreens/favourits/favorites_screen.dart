
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/Views/MainScreens/favourits/widget/favorite_card.dart';
import '../../../Widgets/app_bar.dart';
import 'cupit/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavoritePlaces(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = FavoriteCubit.get(context);
          return Scaffold(
            backgroundColor: const Color(0xFFf8f9f9),
            appBar: const AppAppBar(title: "Favorite"),
            body: state is GetAllFavoritePlacesLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async => await cubit.getFavoritePlaces(),
                    child: ListView.builder(
                      itemCount: cubit.favoritePlacesList.length,
                      itemBuilder: (context, index) {
                        return FavoriteCard(
                          placeName: cubit.favoritePlacesList[index].name ?? 'Not Available',
                          imageUrl: cubit.favoritePlacesList[index].imgUrl!.first ?? 'https://picsum.photos/200/300',
                          placeAddress: cubit.favoritePlacesList[index].address ?? 'Not Available',
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
