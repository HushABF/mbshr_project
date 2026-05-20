import 'package:go_router/go_router.dart';
import 'package:mbshr_project/features/menu/ui/screens/menu_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MenuScreen(),
    ),
  ],
);
