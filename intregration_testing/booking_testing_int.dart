import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/features/booking/domain/entity/booking_entiry.dart';
import 'package:harmo_futsal/features/booking/domain/use_case/booking_usecase.dart';
import 'package:harmo_futsal/features/booking/presentation/view/admin_booking/admin_bookings.dart';
import 'package:harmo_futsal/features/booking/presentation/viewmodel/booking_viewmodel.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

import '../build/unit_test_assets/test_data/booking_entity.dart';
import '../test/unit_testing/booking_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late BookingUseCase mockBookingUsecase;
  late List<BookingEntity> bookingList;
  late List<BookingEntity> useBookings;

  setUpAll(() async {
    mockBookingUsecase = MockBookingUseCase();
    useBookings = await getUserBooking();
    bookingList = await getAllBooking();
  });
  testWidgets('Booking View', (tester) async {
    when(mockBookingUsecase.getAllBookings())
        .thenAnswer((_) async => Right(bookingList));
    when(mockBookingUsecase.getUserBookings())
        .thenAnswer((_) async => Right(useBookings));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bookingViewModelProvider.overrideWith(
            (ref) => BookingViewModel(mockBookingUsecase),
          )
        ],
        child: const MaterialApp(
          home: AdminBooking(), // Use the HomepageView directly
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsWidgets);
    final listViewWidgets = tester.widgetList<ListView>(find.byType(ListView));

    final itemCounts = listViewWidgets
        .map((listView) => listView.childrenDelegate.estimatedChildCount ?? 0)
        .toList();

    expect(itemCounts.length, 1);
  });
}
