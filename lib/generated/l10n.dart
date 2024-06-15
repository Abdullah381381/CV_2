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

  /// `Efreshily`
  String get title {
    return Intl.message(
      'Efreshily',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please login or sign up to continue using our app.`
  String get please_login {
    return Intl.message(
      'Please login or sign up to continue using our app.',
      name: 'please_login',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message(
      'Your Email',
      name: 'yourEmail',
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

  /// `Set password`
  String get setPassword {
    return Intl.message(
      'Set password',
      name: 'setPassword',
      desc: '',
      args: [],
    );
  }

  /// `if you didn’t receive the code! `
  String get resendText {
    return Intl.message(
      'if you didn’t receive the code! ',
      name: 'resendText',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter Password`
  String get rePassword {
    return Intl.message(
      'Re-Enter Password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone`
  String get please_enter_your_phone {
    return Intl.message(
      'Please enter your phone',
      name: 'please_enter_your_phone',
      desc: '',
      args: [],
    );
  }

  /// `We will send you a verification code that you will use to reset your password`
  String get please_enter_your_phoneText {
    return Intl.message(
      'We will send you a verification code that you will use to reset your password',
      name: 'please_enter_your_phoneText',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have account?`
  String get don_have_account {
    return Intl.message(
      'Don’t have account?',
      name: 'don_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get sign_up {
    return Intl.message(
      'Register Now',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourName {
    return Intl.message(
      'Your Name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `your phone`
  String get yourPhone {
    return Intl.message(
      'your phone',
      name: 'yourPhone',
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

  /// `Verification code`
  String get verification_code {
    return Intl.message(
      'Verification code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Verification code`
  String get verification_codeEnter {
    return Intl.message(
      'Enter the Verification code',
      name: 'verification_codeEnter',
      desc: '',
      args: [],
    );
  }

  /// `Verification code has been sent to your phone`
  String get verification_codeSend {
    return Intl.message(
      'Verification code has been sent to your phone',
      name: 'verification_codeSend',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `About us `
  String get aboutUs {
    return Intl.message(
      'About us ',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contact_us {
    return Intl.message(
      'Contact us',
      name: 'contact_us',
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

  /// `privacy policy `
  String get privacy_policy {
    return Intl.message(
      'privacy policy ',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Log out `
  String get log_out {
    return Intl.message(
      'Log out ',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
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

  /// `name street`
  String get name_street {
    return Intl.message(
      'name street',
      name: 'name_street',
      desc: '',
      args: [],
    );
  }

  /// `Special Marque`
  String get specialMarque {
    return Intl.message(
      'Special Marque',
      name: 'specialMarque',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `product details `
  String get product_details {
    return Intl.message(
      'product details ',
      name: 'product_details',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Store info`
  String get store_info {
    return Intl.message(
      'Store info',
      name: 'store_info',
      desc: '',
      args: [],
    );
  }

  /// `Brand:`
  String get brand {
    return Intl.message(
      'Brand:',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Color:`
  String get color {
    return Intl.message(
      'Color:',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Material:`
  String get material {
    return Intl.message(
      'Material:',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `Length:`
  String get length {
    return Intl.message(
      'Length:',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  /// `Width:`
  String get width {
    return Intl.message(
      'Width:',
      name: 'width',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Length with side shelf`
  String get length_with_side_shelf {
    return Intl.message(
      'Length with side shelf',
      name: 'length_with_side_shelf',
      desc: '',
      args: [],
    );
  }

  /// `Length without side shelf`
  String get length_without_side_shelf {
    return Intl.message(
      'Length without side shelf',
      name: 'length_without_side_shelf',
      desc: '',
      args: [],
    );
  }

  /// `All Stores`
  String get allStores {
    return Intl.message(
      'All Stores',
      name: 'allStores',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get stores {
    return Intl.message(
      'Stores',
      name: 'stores',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get category {
    return Intl.message(
      'category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get allProducts {
    return Intl.message(
      'All Products',
      name: 'allProducts',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get best_seller {
    return Intl.message(
      'Best Seller',
      name: 'best_seller',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `New Added`
  String get new_added {
    return Intl.message(
      'New Added',
      name: 'new_added',
      desc: '',
      args: [],
    );
  }

  /// `Top Stores`
  String get top_stores {
    return Intl.message(
      'Top Stores',
      name: 'top_stores',
      desc: '',
      args: [],
    );
  }

  /// `What you are looking for…`
  String get textSearch {
    return Intl.message(
      'What you are looking for…',
      name: 'textSearch',
      desc: '',
      args: [],
    );
  }

  /// `Top Category`
  String get top_category {
    return Intl.message(
      'Top Category',
      name: 'top_category',
      desc: '',
      args: [],
    );
  }

  /// `Delete your account`
  String get delete_your_account {
    return Intl.message(
      'Delete your account',
      name: 'delete_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Similar products`
  String get similar_products {
    return Intl.message(
      'Similar products',
      name: 'similar_products',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `The required data is not available`
  String get notFoundExceptionMessage {
    return Intl.message(
      'The required data is not available',
      name: 'notFoundExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `invalid activation code`
  String get verificationCodeNotValidExceptionMessage {
    return Intl.message(
      'invalid activation code',
      name: 'verificationCodeNotValidExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your account is not activated`
  String get notVerifiedExceptionMessage {
    return Intl.message(
      'Your account is not activated',
      name: 'notVerifiedExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `There are no messages`
  String get noMessagesExceptionMessage {
    return Intl.message(
      'There are no messages',
      name: 'noMessagesExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `You are not allowed to make this request`
  String get unAuthorizedExceptionMessage {
    return Intl.message(
      'You are not allowed to make this request',
      name: 'unAuthorizedExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `The data could not be obtained, please try again later`
  String get serverExceptionMsg {
    return Intl.message(
      'The data could not be obtained, please try again later',
      name: 'serverExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `The data could not be shown`
  String get parseExceptionMsg {
    return Intl.message(
      'The data could not be shown',
      name: 'parseExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `There is currently no data`
  String get noDataExceptionMsg {
    return Intl.message(
      'There is currently no data',
      name: 'noDataExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get unExpectedExceptionMsg {
    return Intl.message(
      'An unexpected error occurred',
      name: 'unExpectedExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection, please check your connection`
  String get noInternetConnectionExceptionMsg {
    return Intl.message(
      'No internet connection, please check your connection',
      name: 'noInternetConnectionExceptionMsg',
      desc: '',
      args: [],
    );
  }

  /// `The current session has expired. Please login again`
  String get sessionExpiredDescription {
    return Intl.message(
      'The current session has expired. Please login again',
      name: 'sessionExpiredDescription',
      desc: '',
      args: [],
    );
  }

  /// `The current session has expired`
  String get sessionExpired {
    return Intl.message(
      'The current session has expired',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `No Data Failure`
  String get noDataFailure {
    return Intl.message(
      'No Data Failure',
      name: 'noDataFailure',
      desc: '',
      args: [],
    );
  }

  /// `Log in with your account`
  String get loginToShowDetails {
    return Intl.message(
      'Log in with your account',
      name: 'loginToShowDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please login with your account to view the full program content`
  String get loginToShowDetailsDescription {
    return Intl.message(
      'Please login with your account to view the full program content',
      name: 'loginToShowDetailsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to sign out of the app?`
  String get logOutText {
    return Intl.message(
      'Are you sure to sign out of the app?',
      name: 'logOutText',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to open the location on the map?`
  String get location_on_the_map {
    return Intl.message(
      'Do you want to open the location on the map?',
      name: 'location_on_the_map',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
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

  /// `Sorry, no results`
  String get no_results {
    return Intl.message(
      'Sorry, no results',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
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
