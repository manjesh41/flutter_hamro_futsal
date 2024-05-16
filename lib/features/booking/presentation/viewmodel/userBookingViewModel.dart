// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../domain/use_case/booking_usecase.dart';
// import '../state/booking_state.dart';

// final uesrBookingViewModelProvider =
//     StateNotifierProvider<UserBookingViewModel, BookingState>(
//   (ref) => UserBookingViewModel(ref.watch(bookingUsecaseProvider)),
// );

// class UserBookingViewModel extends StateNotifier<BookingState> {
//   final BookingUseCase bookingUseCase;

//   UserBookingViewModel(this.bookingUseCase) : super(BookingState.initial()) {
//     getUserBooking();
//   }

//   // deleteBatch() {}

//   getUserBooking() async {
//     state = state.copyWith(isLoading: true);
//     var data = await bookingUseCase.getUserBookings();
//     state = state.copyWith(bookings: []);

//     data.fold(
//       (l) => state = state.copyWith(isLoading: false, error: l.error),
//       (r) => state = state.copyWith(isLoading: false, bookings: r, error: null),
//     );
//   }
// }
