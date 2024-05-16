import 'dart:async';

import 'package:harmo_futsal/config/constants/hive_table_constrant.dart';
import 'package:harmo_futsal/features/booking/data/model/booking_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(BookingHiveModelAdapter());

    // Add dummy data
  }

  Future<void> addBooking(BookingHiveModel book) async {
    var box = await Hive.openBox<BookingHiveModel>(HiveTableConstant.bookBox);
    await box.put(book.bookingId, book);
  }

  Future<List<BookingHiveModel>> getAllBookings() async {
    var box = await Hive.openBox<BookingHiveModel>(HiveTableConstant.bookBox);
    var books = box.values.toList();
    box.close();
    return books;
  }

  Future<List<BookingHiveModel>> getUsersBooking() async {
    var box = await Hive.openBox<BookingHiveModel>(HiveTableConstant.bookBox);
    var books = box.values.toList();
    box.close();
    return books;
  }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<BookingHiveModel>(HiveTableConstant.bookBox);
    await box.clear();
  }

  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    await Hive.deleteBoxFromDisk(HiveTableConstant.bookBox);

    await Hive.deleteFromDisk();
  }
}
