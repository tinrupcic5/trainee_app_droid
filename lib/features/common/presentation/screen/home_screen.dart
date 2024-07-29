import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/core/style/colors.dart';
import 'package:trainee_app/core/style/style_extensions.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/locations/presentation/screen/calendar_screen.dart';
import 'package:trainee_app/features/locations/presentation/screen/home_summary_screen.dart';
import 'package:trainee_app/features/locations/presentation/screen/my_card_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final UserLoginResponse userLogintoken;

  const HomeScreen({super.key, required this.userLogintoken});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedScreenIndex = 0;
  bool _isLoading = false;
  String _version = 'Loading...'; // Initialize with a placeholder
  String _app_name = 'Loading...'; // Initialize with a placeholder
  File? _selectedImage;
  late final List<Widget> _screens;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print("widget.userLogintoken ${widget.userLogintoken}");
    _screens = [
      HomeSummaryScreen(userLogintoken: widget.userLogintoken),
      CalendarScreen(),
      MyCardScreen(),
    ];

    // Using Future.microtask to ensure it runs after the build phase
    Future.microtask(() async {
      final notifier = ref.read(versionNotifierProvider.notifier);
      final version = await notifier.getVersion();
      final app_name = await notifier.getName();
      if (mounted) {
        setState(() {
          _version = version; // Update the state with the fetched version
          _app_name = app_name; // Update the state with the fetched version
        });
      }
    });
  }

  String getScreenName(BuildContext context) {
    final screenName = [
      context.summaryPage,
      context.calendarPage,
      context.myCard,
    ];
    return screenName[_selectedScreenIndex];
  }

  UserDetails getUserDetails() {
    return widget.userLogintoken.userDetails;
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = getUserDetails();

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
            DrawerHeader(
              decoration: const BoxDecoration(
                color: CustomColors.blueCardColor,
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        backgroundColor: CustomColors.blueCardColor,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : AssetImage('assets/images/logo/jjk_pura_vida.png')
                                as ImageProvider,
                        radius: 50,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${userDetails.name} ${userDetails.lastName}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + const Alignment(0, .4),
                    child: Text(
                      userDetails.schoolDetails.schoolLocation,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: Text("Logout"),
              onTap: () {
                if (!_isLoading) {
                  _logout();
                }
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Aligns items to the ends
                children: <Widget>[
                  // Text Column
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _app_name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _version,
                            style: const TextStyle(
                              fontSize: 12, // Subtitle size
                              color:
                                  Colors.black54, // Lighter color for subtitle
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Image
                  SizedBox(
                    width: 30, // Adjust width as needed
                    child: Image.asset(
                      'assets/images/bitroot_logo.png',
                      fit: BoxFit.contain, // Adjust fit as needed
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _logout() async {
    setState(() {
      _isLoading = true;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    await ref.read(logoutNotifierProvider.notifier).attemptLogingOut(context);
    setState(() {
      _isLoading = false;
    });
  }
}
