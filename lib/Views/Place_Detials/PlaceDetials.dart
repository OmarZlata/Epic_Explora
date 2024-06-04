import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../cache/cache_helper.dart';
import '../../core/api/const_end_ponits.dart';
import '../../core/app_colors/app_colors.dart';

class PlaceDetailsScreen extends StatefulWidget {
  PlaceDetailsScreen({Key? key, required this.Address, required this.Desc, required this.ID, required this.Name});
  final String Desc;
  final String Address;
  final int ID;
  final String Name;

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final bool? favoriteStatus = CacheHelper().getBool('favorite_status_${widget.ID}');
    if (favoriteStatus != null) {
      setState(() {
        isFavorite = favoriteStatus;
      });
    }
  }

  Future<void> _saveFavoriteStatus(bool status) async {
    CacheHelper().saveBool('favorite_status_${widget.ID}', status);
  }

  Future<void> SetFav() async {
    final String baseUrl = EndPoint.baseUrl;
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getDataString(key: ApiKey.token)}",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio _dio = Dio(baseOptions);

    try {
      final response = await _dio.post(
        '${baseUrl}api/user/favorite/add/place/${widget.ID}',
        data: {},
      );

      if (response.statusCode == 200) {
        print('Added to favorites successfully: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to favorites successfully'),
            backgroundColor: AppColors.blue
          ),
        );
      } else {
        print('Failed to add to favorites: ${response.statusCode}');
        print('Response: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add to favorites. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error adding to favorites: $e');
    }
  }

  Future<void> RemoveFav() async {
    print("delete???? ${widget.ID}");
    final String baseUrl = EndPoint.baseUrl;
    final BaseOptions baseOptions = BaseOptions(headers: {
      "Authorization": "Bearer ${CacheHelper().getDataString(key: ApiKey.token)}",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
    });
    final Dio _dio = Dio(baseOptions);

    try {
      final response = await _dio.post(
        '${baseUrl}api/user/favorite/delete/${widget.ID}',  // Ensure the endpoint is correct
      );


      if (response.statusCode == 200) {
        print('Removed from favorites successfully: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Removed from favorites successfully'),
              backgroundColor: AppColors.blue
          ),
        );
      } else {
        print('Failed to remove from favorites: ${response.statusCode}');
        print('Response: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to remove from favorites. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error removing from favorites: $e');
    }
  }
  void _launchMaps(String query) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEFEDFF),
                    ),
                    child: const Center(
                      child: Text(
                        "Place ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2F3C7E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 200),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.share_outlined,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          _saveFavoriteStatus(isFavorite);
                          if (isFavorite) {
                            SetFav();
                          } else {
                            RemoveFav();
                          }
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 28,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  const Text(
                    "Price :    ",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const Text(
                    "\$14.4",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(width: 70),
                  const Icon(
                    Icons.favorite,
                    color: AppColors.red,
                    size: 24,
                  ),
                  const Text(
                    "294Likes",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(width: 50),
                  Row(
                    children: [
                      Image.asset('assets/images/rate.png'),
                      const Text("4.5"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.blue,
                        ),
                        Text(
                          "${widget.Address} ,Egypt",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            InkWell(
              onTap: () {
                _launchMaps("${widget.Name} ${widget.Address}");
              },
              child: Container(
                height: 150,
                width: 362,
                child: Image.asset("assets/images/hotel map.png"),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Text(
                        " ${widget.Desc}",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    "Near By",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Container(
                height: 248,
                width: 450,
                // child: ListView.builder(
                //   itemCount: 9,
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) => AppHomeCard(),
                // ),
              ),
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: 344,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Booking Now",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
