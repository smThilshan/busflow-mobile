import 'package:bus_flow_admin/presentation/add-income/add_new_trip.dart';
import 'package:bus_flow_admin/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:bus_flow_admin/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:bus_flow_admin/presentation/login/screens/login_screen.dart';
import 'package:bus_flow_admin/presentation/splash/screens/splash_screen.dart';
import 'package:go_router/go_router.dart' show GoRouter, GoRoute;

final GoRouter router = GoRouter(
  initialLocation: '/add-new-trip',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/', builder: (context, state) => const MainLayout()),
    GoRoute(
      path: '/add-new-trip',
      builder: (context, state) => const AddNewTrip(),
    ),
  ],
);
