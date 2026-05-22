import 'package:go_router/go_router.dart';
import 'package:mbshr_project/features/home/ui/screens/home_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
