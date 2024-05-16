import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/booking/presentation/view/admin_booking/admin_bookings.dart';
import '../../features/booking/presentation/view/user_bboking/booking.dart';
import '../../features/booking/presentation/view/user_bboking/books.dart';
import '../../features/gallery/presentation/view/admin_gallery/admin_gallery.dart';
import '../../features/gallery/presentation/view/user_gallery/gallary.dart';
import '../../features/home/presentation/view/admin/admin_change_pw.dart';
import '../../features/home/presentation/view/admin/admin_dashboard.dart';
import '../../features/home/presentation/view/admin/admin_edit_profile.dart';
import '../../features/home/presentation/view/admin/admin_reviews.dart';
import '../../features/home/presentation/view/admin/admin_users.dart';
import '../../features/home/presentation/view/user/user_changePassword.dart';
import '../../features/home/presentation/view/user/user_dashboard.dart';
import '../../features/home/presentation/view/user/user_editprofile.dart';
import '../../features/home/presentation/view/user/user_profile_get.dart';
import '../../features/reviews/presentation/view/user_reviews/reviews.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String adminRoute = '/admin';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String userEditProfile = "/editProfile";
  static const String changePassword = "/changepassword";
  static const String booknow = "/Booknow";
  static const String books = "/Books";
  static const String gallery = "/gallery";
  static const String reviews = "/reviews";
  static const String adminUsers = "/adminUsers";
  static const String adminGallery = "/adminGallery";
  static const String adminBooking = "/adminBooking";
  static const String adminReviews = "/adminReviews";
  static const String adminChangePassword = "/adminChangePassword";
  static const String adminProfileUpdate = "/adminProfileUpdate";
  static const String userGetProfile = "/userGetProfile";

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const login_page(),
      homeRoute: (context) => const userDb(),
      registerRoute: (context) => const Register_page(),
      changePassword: (context) => const ChangePassword(),
      userEditProfile: (context) => const UserProfileUpdate(),
      booknow: (context) => const BookingPage(),
      books: (context) => const BooksPage(),
      gallery: (context) => const GalleryPage(),
      reviews: (context) => const ReviewPage(),
      adminRoute: (context) => const AdminDb(),
      adminUsers: (context) => const AdminUser(),
      adminGallery: (context) => const AdminGallery(),
      adminBooking: (context) => const AdminBooking(),
      adminReviews: (context) => const AdminReview(),
      adminChangePassword: (context) => const AdminChangePassword(),
      adminProfileUpdate: (context) => const AdminProfileUpdate(),
      userGetProfile: (context) => const UserProfilePage(),
    };
  }
}
