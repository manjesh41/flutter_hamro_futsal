import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {

  final String? bookingId;
  final String? fullname;
  final String? email;
  final String? phoneNum;
  final String? bookingDate;
  final String? startTime;
  final String? endTime;
  final String? status;

  const BookingEntity({
    this.bookingId,
    required this.fullname,
    required this.email,
    required this.phoneNum,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.status,
  

  });

  factory BookingEntity.fromJson(Map<String, dynamic> json) => BookingEntity(
        fullname: json["fullname"],
        bookingDate: json["bookingDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        phoneNum: json["phoneNum"],
        email: json["email"],
        status: json["status"],
      );
    

  Map<String, dynamic> toJson() => {
       "fullname": fullname,
        "bookingDate": bookingDate,
        "startTime": startTime,
        "endTime": endTime,
        "phoneNum": phoneNum,
        "email": email,
        "status": status,

      };

  @override
  List<Object?> get props => [fullname, bookingDate, startTime, endTime, phoneNum, email, status];
}

