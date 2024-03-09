import 'package:flutter/material.dart';

import '../../Widgets/booking_card.dart';

class FutureBooking extends StatelessWidget {
  const FutureBooking({super.key});

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
