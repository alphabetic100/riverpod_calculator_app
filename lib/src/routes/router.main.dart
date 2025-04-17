part of 'router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: HomeScreen.homeScreen,
      path: HomeScreen.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
       GoRoute(
      name: HistoryScreen.historyScreen,
      path: HistoryScreen.historyScreen,
      builder: (context, state) => const HistoryScreen(),
    ),
  ],
);
