import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/features/booking/domain/entity/booking_entiry.dart';
import 'package:harmo_futsal/features/booking/domain/use_case/booking_usecase.dart';
import 'package:harmo_futsal/features/booking/presentation/viewmodel/booking_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/booking_entity.dart';
import 'booking_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<BookingUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late BookingUseCase mockBookingUsecase;
  late List<BookingEntity> bookingList;
  late List<BookingEntity> allBookings;

  setUpAll(() async {
    mockBookingUsecase = MockBookingUseCase();
    bookingList = await getUserBooking();
    allBookings = await getAllBooking();

    when(mockBookingUsecase.getAllBookings())
        .thenAnswer((_) async => const Right([]));

    when(mockBookingUsecase.getUserBookings())
        .thenAnswer((_) async => const Right([]));

    container = ProviderContainer(
      overrides: [
        bookingViewModelProvider.overrideWith(
          (ref) => BookingViewModel(mockBookingUsecase),
        )
      ],
    );
  });

  test('check home initial state', () async {
    await container.read(bookingViewModelProvider.notifier).getUserBooking();
    final homeState = container.read(bookingViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.bookings, isEmpty);
  });

  test('check for the list of books when calling getAllBooks', () async {
    when(mockBookingUsecase.getUserBookings())
        .thenAnswer((_) => Future.value(Right(bookingList)));

    await container.read(bookingViewModelProvider.notifier).getUserBooking();

    final homeState = container.read(bookingViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.bookings, []);
  });
}
