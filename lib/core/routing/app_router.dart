import 'package:go_router/go_router.dart';
import 'package:mbshr_project/features/bottom_nav/ui/bottom_navigation_bar.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BottomNavigationBarScreen(),
    ),
  ],
);
