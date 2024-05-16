import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/booking_entiry.dart';
import '../../domain/use_case/booking_usecase.dart';
import '../state/booking_state.dart';

final bookingViewModelProvider =
    StateNotifierProvider<BookingViewModel, BookingState>(
  (ref) => BookingViewModel(ref.watch(bookingUsecaseProvider)),
);

class BookingViewModel extends StateNotifier<BookingState> {
  final BookingUseCase bookingUseCase;

  BookingViewModel(this.bookingUseCase) : super(BookingState.initial()) {
    getAllBooking();
    getUserBooking();
  }

  // deleteBatch() {}

  addBooking(BookingEntity booking, BuildContext context) async {
    state.copyWith(isLoading: true);
    var data = await bookingUseCase.addBooking(booking);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showSnackBar(
          message: 'Booking Already Exist',
          context: context,
          color: Colors.red,
        );
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(
          message: 'Booking successfully',
          context: context,
        );
      },
    );
  }

  getAllBooking() async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUseCase.getAllBookings();
    state = state.copyWith(bookings: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, bookings: r, error: null),
    );
  }

  getUserBooking() async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUseCase.getUserBookings();
    state = state.copyWith(userbookings: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state =
          state.copyWith(isLoading: false, userbookings: r, error: null),
    );
  }

  deleteUserBooking(String id) async {
    state = state.copyWith(isLoading: true);
    var data = await bookingUseCase.deleteBooking(id);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }
}
