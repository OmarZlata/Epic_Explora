import 'dart:math';

int getRandomNumber() {
  final random = Random();
  return 100 + random.nextInt(401); // 401 because nextInt(401) generates a number from 0 to 400
}


