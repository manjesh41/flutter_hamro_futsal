class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3001/";
  // static const String baseUrl = "http://172.26.1.22:3000/api/v1/";

  // for android emulator
  // static const String baseUrl = "http://192.168.137.1:3001/";
  // static const String baseUrl = "http://192.168.137.1:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "users/login";
  static const String register = "users/register";
  static const String getAllBooking = "booking/allbooking";
  static String addBooking = "booking/futsalbooking";

  static const String getAllReview = "reviews/";
  static const String addReview = "reviews/createReview";
  static const String getAllUser = "users/allUsers";
  static const String getUserBooking = "booking/BookingById";
  static const String changePassword = "users/change-password";
  static const String editProfile = "users/edit-profile";
  static const String getUserProfile = "users/usersId";
  static const String deleteUser = "users/deleteUsers";
  static const String userById = "users/";
  static const String deleteBooking = "booking/";

  // static const String imageUrl = "http://192.168.137.1:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";
}
