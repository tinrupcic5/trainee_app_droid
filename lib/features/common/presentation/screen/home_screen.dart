import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/core/route_generator.dart';
import 'package:trainee_app/core/style/colors.dart';
import 'package:trainee_app/core/style/style_extensions.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';
import 'package:trainee_app/features/common/presentation/widget/custom_snackbar.dart';
import 'package:trainee_app/features/locations/presentation/screen/calendar_screen.dart';
import 'package:trainee_app/features/locations/presentation/screen/home_summary_screen.dart';
import 'package:trainee_app/features/locations/presentation/screen/my_card_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedScreenIndex = 0;
  bool _isLoading = false;

  final _screens = const [
    HomeSummaryScreen(),
    CalendarScreen(),
    MyCardScreen(),
  ];

  String getScreenName(BuildContext context) {
    final screenName = [
      context.summaryPage,
      context.calendarPage,
      context.myCard,
    ];
    return screenName[_selectedScreenIndex];
  }

  Future<UserDetails?> getUserDetails() async {
    return await SharedPrefsManager().getUserDetailsFromLocalCache();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(logoutNotifierProvider, (_, state) {
      state.whenOrNull(
        unauthenticated: (error, shouldShow) {
          setState(() => _isLoading = false);
          if (shouldShow) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => CustomSnackBar.show(
                  context, context.localWrongEmailOrPassword),
            );
          }
        },
        loading: () => setState(() => _isLoading = true),
        logout: (_) {
          setState(() => _isLoading = true);
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.of(context)
                .pushReplacementNamed(RouteGenerator.signInScreen),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(getScreenName(context)),
      ),
      body: SafeArea(
        child: _screens[_selectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        selectedItemColor: context.colorSecondary,
        onTap: (index) {
          if (index >= 0 && index < _screens.length) {
            setState(() => _selectedScreenIndex = index);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            activeIcon: const Icon(Icons.home_filled),
            label: context.summaryPage,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            activeIcon: const Icon(Icons.calendar_month),
            label: context.calendarPage,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            activeIcon: const Icon(Icons.person),
            label: context.myCard,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            FutureBuilder<UserDetails?>(
              future: getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      color: CustomColors.blueCardColor,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      color: CustomColors.blueCardColor,
                    ),
                    child: Center(
                      child: Text(
                        'Error loading user details',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      color: CustomColors.blueCardColor,
                    ),
                    child: Center(
                      child: Text(
                        'No user details found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else {
                  final userDetails = snapshot.data!;
                  return DrawerHeader(
                    decoration: const BoxDecoration(
                      color: CustomColors.blueCardColor,
                    ),
                    child: Stack(
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            backgroundColor: CustomColors.blueCardColor,
                            backgroundImage: AssetImage(
                                'assets/images/logo/jjk_pura_vida.png'),
                            radius: 50,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${userDetails.name} ${userDetails.lastName}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Align(
                          alignment:
                              Alignment.centerRight + const Alignment(0, .4),
                          child: Text(
                            userDetails.schoolDetails.schoolLocation,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.theaters_rounded),
              title: Text("Content"),
              onTap: () {
                setState(() {
                  _selectedScreenIndex = 0;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.notification_add),
              title: Text("Notifications"),
              onTap: () {
                setState(() {
                  _selectedScreenIndex = 1;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: Text("Administration"),
              onTap: () {
                setState(() {
                  _selectedScreenIndex = 2;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Consider adding a separate Settings screen if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: Text("Logout"),
              onTap: () {
                _isLoading;
                _logout();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    await ref.read(logoutNotifierProvider.notifier).attemptLogingOut();
  }
}
