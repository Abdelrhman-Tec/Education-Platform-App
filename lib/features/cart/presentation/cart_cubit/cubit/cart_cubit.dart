import 'dart:convert' show jsonDecode;

import 'package:bloc/bloc.dart';
import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/features/cart/data/model/cart_request_model.dart';
import 'package:education_platform_app/features/cart/data/repo/cart_repo.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState<dynamic>> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(const CartState.initial());

  /// Fetch all items in the cart for the given user id
  Future<void> getAllItemCart(int id) async {
    emit(const CartState.loading());
    try {
      final response = await cartRepo.getAllItemCart(id);
      response.when(
        success: (cart) => emit(CartState.success(cart)),
        failure: (error) => emit(
          CartState.failure(
            error.apiErrorModel.message ?? 'Error loading cart items',
          ),
        ),
      );
    } catch (e) {
      emit(const CartState.failure('Unexpected error, please try again'));
    }
  }

  /// Add a course to the cart
  /// Fetches the user from cache (SharedPrefs) to get the userId
  Future<void> addToCart({required int courseId}) async {
    emit(const CartState.loading());

    // Retrieve the logged-in user from cache
    final userJson = SharedPrefsService.getString('user');
    if (userJson == null) {
      emit(const CartState.failure('You must be logged in first'));
      return;
    }

    // Decode the user JSON and get the user ID
    final user = User.fromJson(jsonDecode(userJson)['user']);
    if (user.id == null) {
      emit(const CartState.failure('User data is invalid'));
      return;
    }

    try {
      // Call repository to add the course to the cart
      final response = await cartRepo.addToCart(
        CartRequestModel(userId: user.id!, courseId: courseId, quantity: 1),
      );

      response.when(
        success: (cart) => emit(CartState.success(cart)),
        failure: (error) => emit(
          CartState.failure(
            error.apiErrorModel.message ?? 'Error adding course to cart',
          ),
        ),
      );
    } catch (e) {
      emit(const CartState.failure('Unexpected error, please try again'));
    }
  }
}
