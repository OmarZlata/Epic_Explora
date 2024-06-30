// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To Epic Explore`
  String get welcome {
    return Intl.message(
      'Welcome To Epic Explore',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Explore a world of possibilities as you`
  String get exploreIntro {
    return Intl.message(
      'Explore a world of possibilities as you',
      name: 'exploreIntro',
      desc: '',
      args: [],
    );
  }

  /// `plan your next adventure .`
  String get planAdventure {
    return Intl.message(
      'plan your next adventure .',
      name: 'planAdventure',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Book Cheapest Flight`
  String get bookFlight {
    return Intl.message(
      'Book Cheapest Flight',
      name: 'bookFlight',
      desc: '',
      args: [],
    );
  }

  /// `We compare prices from 200+ booking`
  String get comparePrices {
    return Intl.message(
      'We compare prices from 200+ booking',
      name: 'comparePrices',
      desc: '',
      args: [],
    );
  }

  /// `site to help you find the lowest price .`
  String get lowestPrice {
    return Intl.message(
      'site to help you find the lowest price .',
      name: 'lowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Share your experiences`
  String get shareExperiences {
    return Intl.message(
      'Share your experiences',
      name: 'shareExperiences',
      desc: '',
      args: [],
    );
  }

  /// `Allow users to share their travel experiences`
  String get allowShare {
    return Intl.message(
      'Allow users to share their travel experiences',
      name: 'allowShare',
      desc: '',
      args: [],
    );
  }

  /// `on social media platforms .`
  String get socialMedia {
    return Intl.message(
      'on social media platforms .',
      name: 'socialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get emailEmpty {
    return Intl.message(
      'Email can\'t be empty',
      name: 'emailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an Account?`
  String get noAccount {
    return Intl.message(
      'Don’t have an Account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I agree`
  String get agree {
    return Intl.message(
      'I agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Check your E-mail`
  String get checkEmail {
    return Intl.message(
      'Check your E-mail',
      name: 'checkEmail',
      desc: '',
      args: [],
    );
  }

  /// `inbox to verify your email`
  String get verifyEmail {
    return Intl.message(
      'inbox to verify your email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continues {
    return Intl.message(
      'Continue',
      name: 'continues',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive reset Code`
  String get resetEmailPrompt {
    return Intl.message(
      'Enter your email to receive reset Code',
      name: 'resetEmailPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password successfully`
  String get resetSuccess {
    return Intl.message(
      'Reset Password successfully',
      name: 'resetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Add Trip`
  String get addTrip {
    return Intl.message(
      'Add Trip',
      name: 'addTrip',
      desc: '',
      args: [],
    );
  }

  /// `Departure`
  String get departure {
    return Intl.message(
      'Departure',
      name: 'departure',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `AirLine`
  String get airline {
    return Intl.message(
      'AirLine',
      name: 'airline',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `arrival`
  String get arrival {
    return Intl.message(
      'arrival',
      name: 'arrival',
      desc: '',
      args: [],
    );
  }

  /// `Current location`
  String get currentLocation {
    return Intl.message(
      'Current location',
      name: 'currentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Upload Documents(jpg.png.pdf),`
  String get uploadDocuments {
    return Intl.message(
      'Upload Documents(jpg.png.pdf),',
      name: 'uploadDocuments',
      desc: '',
      args: [],
    );
  }

  /// `summary`
  String get summary {
    return Intl.message(
      'summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Yemen(Sana’a)`
  String get yemenSanaa {
    return Intl.message(
      'Yemen(Sana’a)',
      name: 'yemenSanaa',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get alexandria {
    return Intl.message(
      'Alexandria',
      name: 'alexandria',
      desc: '',
      args: [],
    );
  }

  /// `Yemenia Air Lines`
  String get yemeniaAirlines {
    return Intl.message(
      'Yemenia Air Lines',
      name: 'yemeniaAirlines',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation DL1234`
  String get confirmationCode {
    return Intl.message(
      'Confirmation DL1234',
      name: 'confirmationCode',
      desc: '',
      args: [],
    );
  }

  /// `Mon,Nov 2024`
  String get departureDate {
    return Intl.message(
      'Mon,Nov 2024',
      name: 'departureDate',
      desc: '',
      args: [],
    );
  }

  /// `upcoming`
  String get upcoming {
    return Intl.message(
      'upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Depart Sana’a  14 Nov`
  String get departSanaa {
    return Intl.message(
      'Depart Sana’a  14 Nov',
      name: 'departSanaa',
      desc: '',
      args: [],
    );
  }

  /// `6:00 AM`
  String get departureTime {
    return Intl.message(
      '6:00 AM',
      name: 'departureTime',
      desc: '',
      args: [],
    );
  }

  /// `show Sana’a Map`
  String get showSanaaMap {
    return Intl.message(
      'show Sana’a Map',
      name: 'showSanaaMap',
      desc: '',
      args: [],
    );
  }

  /// `Duration 1 hr, 15 min > Seat`
  String get durationSeat {
    return Intl.message(
      'Duration 1 hr, 15 min > Seat',
      name: 'durationSeat',
      desc: '',
      args: [],
    );
  }

  /// `Arrive Alexandria  14 Nov`
  String get arriveAlexandria {
    return Intl.message(
      'Arrive Alexandria  14 Nov',
      name: 'arriveAlexandria',
      desc: '',
      args: [],
    );
  }

  /// `7:15 AM`
  String get arrivalTime {
    return Intl.message(
      '7:15 AM',
      name: 'arrivalTime',
      desc: '',
      args: [],
    );
  }

  /// `show Alexandria Map`
  String get showAlexandriaMap {
    return Intl.message(
      'show Alexandria Map',
      name: 'showAlexandriaMap',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message(
      'Documents',
      name: 'documents',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria Trip`
  String get alexandriaTrip {
    return Intl.message(
      'Alexandria Trip',
      name: 'alexandriaTrip',
      desc: '',
      args: [],
    );
  }

  /// `Mon,Nov 20 18 - Fri,Nov 2018`
  String get tripDates {
    return Intl.message(
      'Mon,Nov 20 18 - Fri,Nov 2018',
      name: 'tripDates',
      desc: '',
      args: [],
    );
  }

  /// `15 days`
  String get days {
    return Intl.message(
      '15 days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `On Time`
  String get onTime {
    return Intl.message(
      'On Time',
      name: 'onTime',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get present {
    return Intl.message(
      'Present',
      name: 'present',
      desc: '',
      args: [],
    );
  }

  /// `Future`
  String get future {
    return Intl.message(
      'Future',
      name: 'future',
      desc: '',
      args: [],
    );
  }

  /// `My Trips`
  String get myTrips {
    return Intl.message(
      'My Trips',
      name: 'myTrips',
      desc: '',
      args: [],
    );
  }

  /// `App Mode`
  String get appMode {
    return Intl.message(
      'App Mode',
      name: 'appMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `num`
  String get num {
    return Intl.message(
      'num',
      name: 'num',
      desc: '',
      args: [],
    );
  }

  /// `egp`
  String get currencyEGP {
    return Intl.message(
      'egp',
      name: 'currencyEGP',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currencyCodeEGP {
    return Intl.message(
      'EGP',
      name: 'currencyCodeEGP',
      desc: '',
      args: [],
    );
  }

  /// `USD`
  String get currencyCodeUSD {
    return Intl.message(
      'USD',
      name: 'currencyCodeUSD',
      desc: '',
      args: [],
    );
  }

  /// `UAE`
  String get currencyCodeUAE {
    return Intl.message(
      'UAE',
      name: 'currencyCodeUAE',
      desc: '',
      args: [],
    );
  }

  /// `displayedText`
  String get displayedText {
    return Intl.message(
      'displayedText',
      name: 'displayedText',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Terms of service`
  String get termsOfService {
    return Intl.message(
      'Terms of service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
      desc: '',
      args: [],
    );
  }

  /// `1. Terms`
  String get terms {
    return Intl.message(
      '1. Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `2. Use License`
  String get useLicense {
    return Intl.message(
      '2. Use License',
      name: 'useLicense',
      desc: '',
      args: [],
    );
  }

  /// `Currency Converter`
  String get currencyConverter {
    return Intl.message(
      'Currency Converter',
      name: 'currencyConverter',
      desc: '',
      args: [],
    );
  }

  /// `My Bookings`
  String get myBookings {
    return Intl.message(
      'My Bookings',
      name: 'myBookings',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Hotel`
  String get hotel {
    return Intl.message(
      'Hotel',
      name: 'hotel',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `294 Likes`
  String get likes {
    return Intl.message(
      '294 Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria, Egypt`
  String get location {
    return Intl.message(
      'Alexandria, Egypt',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Classic cheeseburger with beef patty,`
  String get cheeseburgerDesc1 {
    return Intl.message(
      'Classic cheeseburger with beef patty,',
      name: 'cheeseburgerDesc1',
      desc: '',
      args: [],
    );
  }

  /// `pickles, cheese, tomato, onion, lettuce and`
  String get cheeseburgerDesc2 {
    return Intl.message(
      'pickles, cheese, tomato, onion, lettuce and',
      name: 'cheeseburgerDesc2',
      desc: '',
      args: [],
    );
  }

  /// `ketchup mustard. Classic cheeseburger with`
  String get cheeseburgerDesc3 {
    return Intl.message(
      'ketchup mustard. Classic cheeseburger with',
      name: 'cheeseburgerDesc3',
      desc: '',
      args: [],
    );
  }

  /// `beef patty, pickles, cheese, tomato, onion,`
  String get cheeseburgerDesc4 {
    return Intl.message(
      'beef patty, pickles, cheese, tomato, onion,',
      name: 'cheeseburgerDesc4',
      desc: '',
      args: [],
    );
  }

  /// `lettuce and ketchup mustard`
  String get cheeseburgerDesc5 {
    return Intl.message(
      'lettuce and ketchup mustard',
      name: 'cheeseburgerDesc5',
      desc: '',
      args: [],
    );
  }

  /// `Read More.`
  String get readMore {
    return Intl.message(
      'Read More.',
      name: 'readMore',
      desc: '',
      args: [],
    );
  }

  /// `Near By`
  String get nearBy {
    return Intl.message(
      'Near By',
      name: 'nearBy',
      desc: '',
      args: [],
    );
  }

  /// `Booking Now`
  String get bookingNow {
    return Intl.message(
      'Booking Now',
      name: 'bookingNow',
      desc: '',
      args: [],
    );
  }

  /// `Review this hotel`
  String get reviewHotel {
    return Intl.message(
      'Review this hotel',
      name: 'reviewHotel',
      desc: '',
      args: [],
    );
  }

  /// `Write feedback`
  String get writeFeedback {
    return Intl.message(
      'Write feedback',
      name: 'writeFeedback',
      desc: '',
      args: [],
    );
  }

  /// `5 stars`
  String get stars5 {
    return Intl.message(
      '5 stars',
      name: 'stars5',
      desc: '',
      args: [],
    );
  }

  /// `4 stars`
  String get stars4 {
    return Intl.message(
      '4 stars',
      name: 'stars4',
      desc: '',
      args: [],
    );
  }

  /// `3 stars`
  String get stars3 {
    return Intl.message(
      '3 stars',
      name: 'stars3',
      desc: '',
      args: [],
    );
  }

  /// `2 stars`
  String get stars2 {
    return Intl.message(
      '2 stars',
      name: 'stars2',
      desc: '',
      args: [],
    );
  }

  /// `1 stars`
  String get stars1 {
    return Intl.message(
      '1 stars',
      name: 'stars1',
      desc: '',
      args: [],
    );
  }

  /// `36 Reviews`
  String get reviewsCount {
    return Intl.message(
      '36 Reviews',
      name: 'reviewsCount',
      desc: '',
      args: [],
    );
  }

  /// `All reviews`
  String get allReviews {
    return Intl.message(
      'All reviews',
      name: 'allReviews',
      desc: '',
      args: [],
    );
  }

  /// `December 2022`
  String get december2022 {
    return Intl.message(
      'December 2022',
      name: 'december2022',
      desc: '',
      args: [],
    );
  }

  /// `Best Time to Visit`
  String get bestVisitTime {
    return Intl.message(
      'Best Time to Visit',
      name: 'bestVisitTime',
      desc: '',
      args: [],
    );
  }

  /// `perfect beach holiday?`
  String get perfectHoliday {
    return Intl.message(
      'perfect beach holiday?',
      name: 'perfectHoliday',
      desc: '',
      args: [],
    );
  }

  /// `Hi, Mohammed Hassan`
  String get hiUser {
    return Intl.message(
      'Hi, Mohammed Hassan',
      name: 'hiUser',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `All Offers`
  String get allOffers {
    return Intl.message(
      'All Offers',
      name: 'allOffers',
      desc: '',
      args: [],
    );
  }

  /// `offers`
  String get offers {
    return Intl.message(
      'offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Select State`
  String get selectState {
    return Intl.message(
      'Select State',
      name: 'selectState',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get seeMore {
    return Intl.message(
      'See more',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Aswan`
  String get aswan {
    return Intl.message(
      'Aswan',
      name: 'aswan',
      desc: '',
      args: [],
    );
  }

  /// `Recommendations`
  String get recommendations {
    return Intl.message(
      'Recommendations',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `popular`
  String get popular {
    return Intl.message(
      'popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Location code`
  String get locationCode {
    return Intl.message(
      'Location code',
      name: 'locationCode',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Location`
  String get setLocation {
    return Intl.message(
      'Set Your Location',
      name: 'setLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Location`
  String get selectLocation {
    return Intl.message(
      'Select Location',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Booking Details`
  String get bookingDetails {
    return Intl.message(
      'Booking Details',
      name: 'bookingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get booking {
    return Intl.message(
      'Booking',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Check in`
  String get checkIn {
    return Intl.message(
      'Check in',
      name: 'checkIn',
      desc: '',
      args: [],
    );
  }

  /// `Sat 9 Oct 2022`
  String get checkInDate {
    return Intl.message(
      'Sat 9 Oct 2022',
      name: 'checkInDate',
      desc: '',
      args: [],
    );
  }

  /// `13 nights`
  String get nights {
    return Intl.message(
      '13 nights',
      name: 'nights',
      desc: '',
      args: [],
    );
  }

  /// `Check out`
  String get checkOut {
    return Intl.message(
      'Check out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `Sat 18 Oct 2022`
  String get checkOutDate {
    return Intl.message(
      'Sat 18 Oct 2022',
      name: 'checkOutDate',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get userDetails {
    return Intl.message(
      'User Details',
      name: 'userDetails',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `ID Number`
  String get idNumber {
    return Intl.message(
      'ID Number',
      name: 'idNumber',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `1000 LE`
  String get amountLE {
    return Intl.message(
      '1000 LE',
      name: 'amountLE',
      desc: '',
      args: [],
    );
  }

  /// `App Wallet`
  String get appWallet {
    return Intl.message(
      'App Wallet',
      name: 'appWallet',
      desc: '',
      args: [],
    );
  }

  /// `E - Wallet`
  String get eWallet {
    return Intl.message(
      'E - Wallet',
      name: 'eWallet',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message(
      'Credit Card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Pay - 100 LE`
  String get payAmount {
    return Intl.message(
      'Pay - 100 LE',
      name: 'payAmount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `8000 `
  String get bookingAmount {
    return Intl.message(
      '8000 ',
      name: 'bookingAmount',
      desc: '',
      args: [],
    );
  }

  /// `Cancel booking`
  String get cancelBooking {
    return Intl.message(
      'Cancel booking',
      name: 'cancelBooking',
      desc: '',
      args: [],
    );
  }

  /// `View confirmation`
  String get viewConfirmation {
    return Intl.message(
      'View confirmation',
      name: 'viewConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `confirmation`
  String get confirmation {
    return Intl.message(
      'confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Price range`
  String get priceRange {
    return Intl.message(
      'Price range',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `$_startValue`
  String get startValue {
    return Intl.message(
      '\$_startValue',
      name: 'startValue',
      desc: '',
      args: [],
    );
  }

  /// `$_endValue`
  String get endValue {
    return Intl.message(
      '\$_endValue',
      name: 'endValue',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message(
      'Dismiss',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Select Method`
  String get selectMethod {
    return Intl.message(
      'Select Method',
      name: 'selectMethod',
      desc: '',
      args: [],
    );
  }

  /// `Name on Card`
  String get cardName {
    return Intl.message(
      'Name on Card',
      name: 'cardName',
      desc: '',
      args: [],
    );
  }

  /// `Card Name`
  String get nameOnCard {
    return Intl.message(
      'Card Name',
      name: 'nameOnCard',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get enterName {
    return Intl.message(
      'Please enter your name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message(
      'Card Number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Card`
  String get enterCardNumber {
    return Intl.message(
      'Please enter your Card',
      name: 'enterCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Card`
  String get invalidCard {
    return Intl.message(
      'Invalid Card',
      name: 'invalidCard',
      desc: '',
      args: [],
    );
  }

  /// `Expire Date`
  String get expireDate {
    return Intl.message(
      'Expire Date',
      name: 'expireDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Expire Date'`
  String get enterExpireDate {
    return Intl.message(
      'Please enter your Expire Date\'',
      name: 'enterExpireDate',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your CVV`
  String get enterCVV {
    return Intl.message(
      'Please enter your CVV',
      name: 'enterCVV',
      desc: '',
      args: [],
    );
  }

  /// `Invalid CVV`
  String get invalidCVV {
    return Intl.message(
      'Invalid CVV',
      name: 'invalidCVV',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get luxor {
    return Intl.message(
      'Luxor',
      name: 'luxor',
      desc: '',
      args: [],
    );
  }

  /// `Red Sea`
  String get redSea {
    return Intl.message(
      'Red Sea',
      name: 'redSea',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cairo {
    return Intl.message(
      'Cairo',
      name: 'cairo',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load data`
  String get dataLoadFail {
    return Intl.message(
      'Failed to load data',
      name: 'dataLoadFail',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get error {
    return Intl.message(
      'Something went wrong!',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `No Name`
  String get noName {
    return Intl.message(
      'No Name',
      name: 'noName',
      desc: '',
      args: [],
    );
  }

  /// `Location not available`
  String get locationUnavailable {
    return Intl.message(
      'Location not available',
      name: 'locationUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Added to favorites successfully`
  String get favoritesAddSuccess {
    return Intl.message(
      'Added to favorites successfully',
      name: 'favoritesAddSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add to favorites. Please try again.`
  String get favoritesAddFail {
    return Intl.message(
      'Failed to add to favorites. Please try again.',
      name: 'favoritesAddFail',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites successfully`
  String get favoritesRemoveSuccess {
    return Intl.message(
      'Removed from favorites successfully',
      name: 'favoritesRemoveSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to remove from favorites`
  String get favoritesRemoveFail {
    return Intl.message(
      'Failed to remove from favorites',
      name: 'favoritesRemoveFail',
      desc: '',
      args: [],
    );
  }

  /// `Error removing from favorites`
  String get favoritesRemoveError {
    return Intl.message(
      'Error removing from favorites',
      name: 'favoritesRemoveError',
      desc: '',
      args: [],
    );
  }

  /// `Review submitted successfully!`
  String get reviewSubmitSuccess {
    return Intl.message(
      'Review submitted successfully!',
      name: 'reviewSubmitSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to submit review. Please try again.`
  String get reviewSubmitFail {
    return Intl.message(
      'Failed to submit review. Please try again.',
      name: 'reviewSubmitFail',
      desc: '',
      args: [],
    );
  }

  /// `Rate this hotel`
  String get rateHotel {
    return Intl.message(
      'Rate this hotel',
      name: 'rateHotel',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `currentPage`
  String get currentPage {
    return Intl.message(
      'currentPage',
      name: 'currentPage',
      desc: '',
      args: [],
    );
  }

  /// `Selected location`
  String get selectedLocation {
    return Intl.message(
      'Selected location',
      name: 'selectedLocation',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Location`
  String get findLocation {
    return Intl.message(
      'Find Your Location',
      name: 'findLocation',
      desc: '',
      args: [],
    );
  }

  /// `Find Every Place Around You`
  String get findPlaces {
    return Intl.message(
      'Find Every Place Around You',
      name: 'findPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Let's Explore`
  String get explore {
    return Intl.message(
      'Let\'s Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Register As User`
  String get registerUser {
    return Intl.message(
      'Register As User',
      name: 'registerUser',
      desc: '',
      args: [],
    );
  }

  /// `Register As Guider`
  String get registerGuider {
    return Intl.message(
      'Register As Guider',
      name: 'registerGuider',
      desc: '',
      args: [],
    );
  }

  /// `Please select an image`
  String get selectImage {
    return Intl.message(
      'Please select an image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `add images`
  String get addImages {
    return Intl.message(
      'add images',
      name: 'addImages',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get place {
    return Intl.message(
      'Place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `Review this Place`
  String get reviewPlace {
    return Intl.message(
      'Review this Place',
      name: 'reviewPlace',
      desc: '',
      args: [],
    );
  }

  /// `Rate this Place`
  String get ratePlace {
    return Intl.message(
      'Rate this Place',
      name: 'ratePlace',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Nasser`
  String get userName {
    return Intl.message(
      'Ahmed Nasser',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Convert`
  String get convert {
    return Intl.message(
      'Convert',
      name: 'convert',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get enterAmount {
    return Intl.message(
      'Enter amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure You Want`
  String get confirmLogout {
    return Intl.message(
      'Are You Sure You Want',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `To Logout ?`
  String get logoutPrompt {
    return Intl.message(
      'To Logout ?',
      name: 'logoutPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Profile Settings`
  String get profileSettings {
    return Intl.message(
      'Profile Settings',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `No Email`
  String get noEmail {
    return Intl.message(
      'No Email',
      name: 'noEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your Memories`
  String get yourMemories {
    return Intl.message(
      'Your Memories',
      name: 'yourMemories',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated successfully.`
  String get profileUpdateSuccess {
    return Intl.message(
      'Your profile has been updated successfully.',
      name: 'profileUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Update your profile.`
  String get profileUpdateFail {
    return Intl.message(
      'Failed to Update your profile.',
      name: 'profileUpdateFail',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `E-mail are not correct`
  String get emailIncorrect {
    return Intl.message(
      'E-mail are not correct',
      name: 'emailIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordPrompt {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordPrompt',
      desc: '',
      args: [],
    );
  }

  /// `E-mail or Password are not correct`
  String get loginError {
    return Intl.message(
      'E-mail or Password are not correct',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get invalidOTP {
    return Intl.message(
      'Invalid OTP',
      name: 'invalidOTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your OTP`
  String get enterOTP {
    return Intl.message(
      'Enter Your OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Haven't Received the verification code!?`
  String get resendOTP {
    return Intl.message(
      'Haven\'t Received the verification code!?',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Resend in $counter seconds`
  String get resendCounter {
    return Intl.message(
      'Resend in \$counter seconds',
      name: 'resendCounter',
      desc: '',
      args: [],
    );
  }

  /// `Trips Gallery`
  String get tripsGallery {
    return Intl.message(
      'Trips Gallery',
      name: 'tripsGallery',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria Gallery`
  String get alexandriaGallery {
    return Intl.message(
      'Alexandria Gallery',
      name: 'alexandriaGallery',
      desc: '',
      args: [],
    );
  }

  /// `Aswan Gallery`
  String get aswanGallery {
    return Intl.message(
      'Aswan Gallery',
      name: 'aswanGallery',
      desc: '',
      args: [],
    );
  }

  /// `Cairo Gallery`
  String get cairoGallery {
    return Intl.message(
      'Cairo Gallery',
      name: 'cairoGallery',
      desc: '',
      args: [],
    );
  }

  /// `Luxor Gallery`
  String get luxorGallery {
    return Intl.message(
      'Luxor Gallery',
      name: 'luxorGallery',
      desc: '',
      args: [],
    );
  }

  /// `RedSea Gallery`
  String get redSeaGallery {
    return Intl.message(
      'RedSea Gallery',
      name: 'redSeaGallery',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an Account ?`
  String get noAccountPrompt {
    return Intl.message(
      'Don’t have an Account ?',
      name: 'noAccountPrompt',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signUpPrompt {
    return Intl.message(
      'SignUp',
      name: 'signUpPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Registration Done`
  String get registrationDone {
    return Intl.message(
      'Registration Done',
      name: 'registrationDone',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Sign Up`
  String get signUpFail {
    return Intl.message(
      'Failed to Sign Up',
      name: 'signUpFail',
      desc: '',
      args: [],
    );
  }

  /// `Tour Guide SignUp`
  String get tourGuideSignUp {
    return Intl.message(
      'Tour Guide SignUp',
      name: 'tourGuideSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Please enter your Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Phone Number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid Phone Number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalID {
    return Intl.message(
      'National ID',
      name: 'nationalID',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your National ID`
  String get enterNationalID {
    return Intl.message(
      'Please enter your National ID',
      name: 'enterNationalID',
      desc: '',
      args: [],
    );
  }

  /// `Invalid National ID`
  String get invalidNationalID {
    return Intl.message(
      'Invalid National ID',
      name: 'invalidNationalID',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Tour Guide Home`
  String get tourGuideHome {
    return Intl.message(
      'Tour Guide Home',
      name: 'tourGuideHome',
      desc: '',
      args: [],
    );
  }

  /// `Cairo International Stadium`
  String get stadium {
    return Intl.message(
      'Cairo International Stadium',
      name: 'stadium',
      desc: '',
      args: [],
    );
  }

  /// `Request From : Omar`
  String get requestFrom {
    return Intl.message(
      'Request From : Omar',
      name: 'requestFrom',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number : 0261537625`
  String get phone {
    return Intl.message(
      'Phone Number : 0261537625',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `4.5`
  String get rating {
    return Intl.message(
      '4.5',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `$14.4`
  String get priceInUSD {
    return Intl.message(
      '\$14.4',
      name: 'priceInUSD',
      desc: '',
      args: [],
    );
  }

  /// `8000 LE`
  String get totalLE {
    return Intl.message(
      '8000 LE',
      name: 'totalLE',
      desc: '',
      args: [],
    );
  }

  /// `Tour Guider`
  String get tourGuider {
    return Intl.message(
      'Tour Guider',
      name: 'tourGuider',
      desc: '',
      args: [],
    );
  }

  /// `States`
  String get states {
    return Intl.message(
      'States',
      name: 'states',
      desc: '',
      args: [],
    );
  }

  /// `Trips`
  String get trips {
    return Intl.message(
      'Trips',
      name: 'trips',
      desc: '',
      args: [],
    );
  }

  /// `Our Guiders`
  String get ourGuiders {
    return Intl.message(
      'Our Guiders',
      name: 'ourGuiders',
      desc: '',
      args: [],
    );
  }

  /// `Aswan Guider`
  String get aswanGuider {
    return Intl.message(
      'Aswan Guider',
      name: 'aswanGuider',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message(
      'Available',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Abdallah`
  String get guiderName {
    return Intl.message(
      'Ahmed Abdallah',
      name: 'guiderName',
      desc: '',
      args: [],
    );
  }

  /// `sar`
  String get currencySAR {
    return Intl.message(
      'sar',
      name: 'currencySAR',
      desc: '',
      args: [],
    );
  }

  /// `eur`
  String get currencyEUR {
    return Intl.message(
      'eur',
      name: 'currencyEUR',
      desc: '',
      args: [],
    );
  }

  /// `usd`
  String get currencyUSD {
    return Intl.message(
      'usd',
      name: 'currencyUSD',
      desc: '',
      args: [],
    );
  }

  /// `jpy`
  String get currencyJPY {
    return Intl.message(
      'jpy',
      name: 'currencyJPY',
      desc: '',
      args: [],
    );
  }

  /// `gbp`
  String get currencyGBP {
    return Intl.message(
      'gbp',
      name: 'currencyGBP',
      desc: '',
      args: [],
    );
  }

  /// `aud`
  String get currencyAUD {
    return Intl.message(
      'aud',
      name: 'currencyAUD',
      desc: '',
      args: [],
    );
  }

  /// `cad`
  String get currencyCAD {
    return Intl.message(
      'cad',
      name: 'currencyCAD',
      desc: '',
      args: [],
    );
  }

  /// `chf`
  String get currencyCHF {
    return Intl.message(
      'chf',
      name: 'currencyCHF',
      desc: '',
      args: [],
    );
  }

  /// `cny`
  String get currencyCNY {
    return Intl.message(
      'cny',
      name: 'currencyCNY',
      desc: '',
      args: [],
    );
  }

  /// `sek`
  String get currencySEK {
    return Intl.message(
      'sek',
      name: 'currencySEK',
      desc: '',
      args: [],
    );
  }

  /// `nzd`
  String get currencyNZD {
    return Intl.message(
      'nzd',
      name: 'currencyNZD',
      desc: '',
      args: [],
    );
  }

  /// `krw`
  String get currencyKRW {
    return Intl.message(
      'krw',
      name: 'currencyKRW',
      desc: '',
      args: [],
    );
  }

  /// `mxn`
  String get currencyMXN {
    return Intl.message(
      'mxn',
      name: 'currencyMXN',
      desc: '',
      args: [],
    );
  }

  /// `sgd`
  String get currencySGD {
    return Intl.message(
      'sgd',
      name: 'currencySGD',
      desc: '',
      args: [],
    );
  }

  /// `nok`
  String get currencyNOK {
    return Intl.message(
      'nok',
      name: 'currencyNOK',
      desc: '',
      args: [],
    );
  }

  /// `inr`
  String get currencyINR {
    return Intl.message(
      'inr',
      name: 'currencyINR',
      desc: '',
      args: [],
    );
  }

  /// `rub`
  String get currencyRUB {
    return Intl.message(
      'rub',
      name: 'currencyRUB',
      desc: '',
      args: [],
    );
  }

  /// `brl`
  String get currencyBRL {
    return Intl.message(
      'brl',
      name: 'currencyBRL',
      desc: '',
      args: [],
    );
  }

  /// `zar`
  String get currencyZAR {
    return Intl.message(
      'zar',
      name: 'currencyZAR',
      desc: '',
      args: [],
    );
  }

  /// `hkd`
  String get currencyHKD {
    return Intl.message(
      'hkd',
      name: 'currencyHKD',
      desc: '',
      args: [],
    );
  }

  /// `try`
  String get currencyTRY {
    return Intl.message(
      'try',
      name: 'currencyTRY',
      desc: '',
      args: [],
    );
  }

  /// `Translator`
  String get translator {
    return Intl.message(
      'Translator',
      name: 'translator',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
