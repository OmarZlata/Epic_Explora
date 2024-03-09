import 'package:epic_expolre/Widgets/booking_card.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousBooking extends StatelessWidget {
  const PreviousBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (context, index) => BookingCard() ,
        itemCount: 5,
      ),
    );
  }
}
