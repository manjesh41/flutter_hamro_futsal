import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';

import '../../domain/entity/booking_entiry.dart';

class BookingState {
  final bool isLoading;
  final List<BookingEntity> bookings;
  final List<BookingEntity> userbookings;
  final List<UserEntity>? user;
  final String? error;

  BookingState({
    this.user,
    required this.isLoading,
    required this.bookings,
    required this.userbookings,
    this.error,
  });

  factory BookingState.initial() {
    return BookingState(
      isLoading: false,
      user: [],
      userbookings: [],
      bookings: [],
    );
  }

  BookingState copyWith({
    bool? isLoading,
    List<BookingEntity>? bookings,
    List<BookingEntity>? userbookings,
    List<UserEntity>? user,
    String? error,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      bookings: bookings ?? this.bookings,
      userbookings: userbookings ?? this.userbookings,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
