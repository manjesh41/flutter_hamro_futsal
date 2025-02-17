// Mocks generated by Mockito 5.4.2 from annotations
// in harmo_futsal/test/unit_testing/booking_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:harmo_futsal/core/failure/failure.dart' as _i6;
import 'package:harmo_futsal/features/booking/domain/entity/booking_entiry.dart'
    as _i7;
import 'package:harmo_futsal/features/booking/domain/repository/booking_repositary.dart'
    as _i2;
import 'package:harmo_futsal/features/booking/domain/use_case/booking_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIBookingRepository_0 extends _i1.SmartFake
    implements _i2.IBookingRepository {
  _FakeIBookingRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BookingUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockBookingUseCase extends _i1.Mock implements _i4.BookingUseCase {
  @override
  _i2.IBookingRepository get bookingRepository => (super.noSuchMethod(
        Invocation.getter(#bookingRepository),
        returnValue: _FakeIBookingRepository_0(
          this,
          Invocation.getter(#bookingRepository),
        ),
        returnValueForMissingStub: _FakeIBookingRepository_0(
          this,
          Invocation.getter(#bookingRepository),
        ),
      ) as _i2.IBookingRepository);
  @override
  _i5.Future<
      _i3
          .Either<_i6.Failure, List<_i7.BookingEntity>>> getAllBookings() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllBookings,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BookingEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BookingEntity>>(
          this,
          Invocation.method(
            #getAllBookings,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BookingEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BookingEntity>>(
          this,
          Invocation.method(
            #getAllBookings,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BookingEntity>>>);
  @override
  _i5.Future<
      _i3
          .Either<_i6.Failure, List<_i7.BookingEntity>>> getUserBookings() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserBookings,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BookingEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BookingEntity>>(
          this,
          Invocation.method(
            #getUserBookings,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BookingEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BookingEntity>>(
          this,
          Invocation.method(
            #getUserBookings,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BookingEntity>>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> addBooking(
          _i7.BookingEntity? booking) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBooking,
          [booking],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addBooking,
            [booking],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addBooking,
            [booking],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> deleteBooking(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBooking,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteBooking,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteBooking,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}
