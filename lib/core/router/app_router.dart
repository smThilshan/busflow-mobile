import 'package:bus_flow_admin/presentation/add-income/hire/screens/add_new_hire.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/screens/add_new_trip.dart';
import 'package:bus_flow_admin/presentation/add-income/hire/screens/preview_new_hire.dart';
import 'package:bus_flow_admin/presentation/add-income/trip/screens/preview_new_trip.dart';
import 'package:bus_flow_admin/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:bus_flow_admin/presentation/dashboard/screens/home_screen.dart';
import 'package:bus_flow_admin/presentation/login/screens/login_screen.dart';
import 'package:bus_flow_admin/presentation/splash/screens/splash_screen.dart';
import 'package:go_router/go_router.dart' show GoRouter, GoRoute;

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/', builder: (context, state) => const MainLayout()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/add-new-trip',
      builder: (context, state) => const AddNewTrip(),
    ),
    GoRoute(
      path: '/preview-new-trip',
      builder: (context, state) => const PreviewNewTrip(),
    ),
    GoRoute(
      path: '/add-new-hire',
      builder: (context, state) => const AddNewHire(),
    ),
    GoRoute(
      path: '/preview-new-hire',
      builder: (context, state) => const PreviewNewHire(),
    ),
  ],
);
