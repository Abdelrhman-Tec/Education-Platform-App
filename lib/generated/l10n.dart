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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Korsany`
  String get appName {
    return Intl.message('Korsany', name: 'appName', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `An error occurred`
  String get error {
    return Intl.message('An error occurred', name: 'error', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `My Courses`
  String get myCourses {
    return Intl.message('My Courses', name: 'myCourses', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Marketing`
  String get marketing {
    return Intl.message('Marketing', name: 'marketing', desc: '', args: []);
  }

  /// `Design`
  String get design {
    return Intl.message('Design', name: 'design', desc: '', args: []);
  }

  /// `Media`
  String get media {
    return Intl.message('Media', name: 'media', desc: '', args: []);
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `Programming`
  String get programming {
    return Intl.message('Programming', name: 'programming', desc: '', args: []);
  }

  /// `Business`
  String get business {
    return Intl.message('Business', name: 'business', desc: '', args: []);
  }

  /// `Psychology`
  String get psychology {
    return Intl.message('Psychology', name: 'psychology', desc: '', args: []);
  }

  /// `Start Course`
  String get startCourse {
    return Intl.message(
      'Start Course',
      name: 'startCourse',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message('Buy Now', name: 'buyNow', desc: '', args: []);
  }

  /// `Course Content`
  String get courseContent {
    return Intl.message(
      'Course Content',
      name: 'courseContent',
      desc: '',
      args: [],
    );
  }

  /// `Lecture`
  String get lectures {
    return Intl.message('Lecture', name: 'lectures', desc: '', args: []);
  }

  /// `Student`
  String get students {
    return Intl.message('Student', name: 'students', desc: '', args: []);
  }

  /// `Review`
  String get reviews {
    return Intl.message('Review', name: 'reviews', desc: '', args: []);
  }

  /// `Instructor`
  String get instructor {
    return Intl.message('Instructor', name: 'instructor', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Last Updated`
  String get lastUpdated {
    return Intl.message(
      'Last Updated',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showMore {
    return Intl.message('Show More', name: 'showMore', desc: '', args: []);
  }

  /// `Featured Courses`
  String get featuredCourses {
    return Intl.message(
      'Featured Courses',
      name: 'featuredCourses',
      desc: '',
      args: [],
    );
  }

  /// `Most Viewed Courses`
  String get mostViewed {
    return Intl.message(
      'Most Viewed Courses',
      name: 'mostViewed',
      desc: '',
      args: [],
    );
  }

  /// `Popular Courses`
  String get popularCourses {
    return Intl.message(
      'Popular Courses',
      name: 'popularCourses',
      desc: '',
      args: [],
    );
  }

  /// `New Courses`
  String get newCourses {
    return Intl.message('New Courses', name: 'newCourses', desc: '', args: []);
  }

  /// `Discount Courses`
  String get discountCourses {
    return Intl.message(
      'Discount Courses',
      name: 'discountCourses',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Enter Coupon`
  String get enterCoupon {
    return Intl.message(
      'Enter Coupon',
      name: 'enterCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Cart is Empty`
  String get emptyCart {
    return Intl.message('Cart is Empty', name: 'emptyCart', desc: '', args: []);
  }

  /// `Continue Shopping`
  String get continueShopping {
    return Intl.message(
      'Continue Shopping',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message('My Profile', name: 'myProfile', desc: '', args: []);
  }

  /// `Certificates`
  String get certificates {
    return Intl.message(
      'Certificates',
      name: 'certificates',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Courses`
  String get favoriteCourses {
    return Intl.message(
      'Favorite Courses',
      name: 'favoriteCourses',
      desc: '',
      args: [],
    );
  }

  /// `Discount Coupons`
  String get discountCoupons {
    return Intl.message(
      'Discount Coupons',
      name: 'discountCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
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

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
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

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
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

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
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

  /// `Personal Information`
  String get personalInfo {
    return Intl.message(
      'Personal Information',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
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

  /// `Course Progress`
  String get courseProgress {
    return Intl.message(
      'Course Progress',
      name: 'courseProgress',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `Not Started`
  String get notStarted {
    return Intl.message('Not Started', name: 'notStarted', desc: '', args: []);
  }

  /// `Continue Learning`
  String get continueLearning {
    return Intl.message(
      'Continue Learning',
      name: 'continueLearning',
      desc: '',
      args: [],
    );
  }

  /// `View Certificate`
  String get viewCertificate {
    return Intl.message(
      'View Certificate',
      name: 'viewCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Rate Course`
  String get rateCourse {
    return Intl.message('Rate Course', name: 'rateCourse', desc: '', args: []);
  }

  /// `Write Review`
  String get writeReview {
    return Intl.message(
      'Write Review',
      name: 'writeReview',
      desc: '',
      args: [],
    );
  }

  /// `Your Rating`
  String get yourRating {
    return Intl.message('Your Rating', name: 'yourRating', desc: '', args: []);
  }

  /// `Course Rating`
  String get courseRating {
    return Intl.message(
      'Course Rating',
      name: 'courseRating',
      desc: '',
      args: [],
    );
  }

  /// `Student Reviews`
  String get studentReviews {
    return Intl.message(
      'Student Reviews',
      name: 'studentReviews',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `New Message`
  String get newMessage {
    return Intl.message('New Message', name: 'newMessage', desc: '', args: []);
  }

  /// `Course Update`
  String get courseUpdate {
    return Intl.message(
      'Course Update',
      name: 'courseUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Discount Offer`
  String get discountOffer {
    return Intl.message(
      'Discount Offer',
      name: 'discountOffer',
      desc: '',
      args: [],
    );
  }

  /// `Search Courses`
  String get searchCourses {
    return Intl.message(
      'Search Courses',
      name: 'searchCourses',
      desc: '',
      args: [],
    );
  }

  /// `Search Results`
  String get searchResults {
    return Intl.message(
      'Search Results',
      name: 'searchResults',
      desc: '',
      args: [],
    );
  }

  /// `No Results`
  String get noResults {
    return Intl.message('No Results', name: 'noResults', desc: '', args: []);
  }

  /// `Search for course, instructor, or topic`
  String get searchHint {
    return Intl.message(
      'Search for course, instructor, or topic',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Level`
  String get level {
    return Intl.message('Level', name: 'level', desc: '', args: []);
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Newest`
  String get newest {
    return Intl.message('Newest', name: 'newest', desc: '', args: []);
  }

  /// `Popular`
  String get popular {
    return Intl.message('Popular', name: 'popular', desc: '', args: []);
  }

  /// `Price: Low to High`
  String get priceLowToHigh {
    return Intl.message(
      'Price: Low to High',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price: High to Low`
  String get priceHighToLow {
    return Intl.message(
      'Price: High to Low',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message('Beginner', name: 'beginner', desc: '', args: []);
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message('Advanced', name: 'advanced', desc: '', args: []);
  }

  /// `All Levels`
  String get allLevels {
    return Intl.message('All Levels', name: 'allLevels', desc: '', args: []);
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message('Credit Card', name: 'creditCard', desc: '', args: []);
  }

  /// `PayPal`
  String get paypal {
    return Intl.message('PayPal', name: 'paypal', desc: '', args: []);
  }

  /// `Apple Pay`
  String get applePay {
    return Intl.message('Apple Pay', name: 'applePay', desc: '', args: []);
  }

  /// `Google Pay`
  String get googlePay {
    return Intl.message('Google Pay', name: 'googlePay', desc: '', args: []);
  }

  /// `Payment Successful`
  String get paymentSuccess {
    return Intl.message(
      'Payment Successful',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get paymentFailed {
    return Intl.message(
      'Payment Failed',
      name: 'paymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Network Connection Error`
  String get networkError {
    return Intl.message(
      'Network Connection Error',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get serverError {
    return Intl.message(
      'Server Error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknownError {
    return Intl.message(
      'Unknown Error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message('Coming Soon', name: 'comingSoon', desc: '', args: []);
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
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

  /// `Weak password`
  String get weakPassword {
    return Intl.message(
      'Weak password',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhone {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Course added to cart`
  String get courseAddedToCart {
    return Intl.message(
      'Course added to cart',
      name: 'courseAddedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Purchase successful`
  String get purchaseSuccess {
    return Intl.message(
      'Purchase successful',
      name: 'purchaseSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated`
  String get profileUpdated {
    return Intl.message(
      'Profile updated',
      name: 'profileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Password changed`
  String get passwordChanged {
    return Intl.message(
      'Password changed',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Review submitted`
  String get reviewSubmitted {
    return Intl.message(
      'Review submitted',
      name: 'reviewSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message('Sign Out', name: 'signOut', desc: '', args: []);
  }

  /// `Sign In with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign In with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign In with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Twitter`
  String get signInWithTwitter {
    return Intl.message(
      'Sign In with Twitter',
      name: 'signInWithTwitter',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Linkedin`
  String get signInWithLinkedin {
    return Intl.message(
      'Sign In with Linkedin',
      name: 'signInWithLinkedin',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Github`
  String get signInWithGithub {
    return Intl.message(
      'Sign In with Github',
      name: 'signInWithGithub',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Phone`
  String get signInWithPhone {
    return Intl.message(
      'Sign In with Phone',
      name: 'signInWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Email`
  String get signInWithEmail {
    return Intl.message(
      'Sign In with Email',
      name: 'signInWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Google`
  String get signUpWithGoogle {
    return Intl.message(
      'Sign Up with Google',
      name: 'signUpWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Apple`
  String get signUpWithApple {
    return Intl.message(
      'Sign Up with Apple',
      name: 'signUpWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Facebook`
  String get signUpWithFacebook {
    return Intl.message(
      'Sign Up with Facebook',
      name: 'signUpWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Twitter`
  String get signUpWithTwitter {
    return Intl.message(
      'Sign Up with Twitter',
      name: 'signUpWithTwitter',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Linkedin`
  String get signUpWithLinkedin {
    return Intl.message(
      'Sign Up with Linkedin',
      name: 'signUpWithLinkedin',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Github`
  String get signUpWithGithub {
    return Intl.message(
      'Sign Up with Github',
      name: 'signUpWithGithub',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Phone`
  String get signUpWithPhone {
    return Intl.message(
      'Sign Up with Phone',
      name: 'signUpWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Email`
  String get signUpWithEmail {
    return Intl.message(
      'Sign Up with Email',
      name: 'signUpWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Create your account and start your learning journey with us`
  String get signUpSubtitle {
    return Intl.message(
      'Create your account and start your learning journey with us',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 lowercase letter`
  String get passwordValidationLowercase {
    return Intl.message(
      'At least 1 lowercase letter',
      name: 'passwordValidationLowercase',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 uppercase letter`
  String get passwordValidationUppercase {
    return Intl.message(
      'At least 1 uppercase letter',
      name: 'passwordValidationUppercase',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 number`
  String get passwordValidationNumber {
    return Intl.message(
      'At least 1 number',
      name: 'passwordValidationNumber',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get passwordValidationMinLength {
    return Intl.message(
      'At least 8 characters',
      name: 'passwordValidationMinLength',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 special character`
  String get passwordValidationSpecialCharacter {
    return Intl.message(
      'At least 1 special character',
      name: 'passwordValidationSpecialCharacter',
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
