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
import 'package:trainee_app/features/files/domain/profile_image.dart';
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
  String _version = 'Loading...';
  String _appName = 'Loading...';
  ProfileImage? _profileImage;
  File? _selectedImage;
  List<Widget>? _screens; // Changed from `late` to nullable

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final profileImageNotifier =
        ref.read(profileImageNotifierProvider.notifier);
    final versionNotifier = ref.read(versionNotifierProvider.notifier);

    try {
      final version = await versionNotifier.getVersion();
      final appName = await versionNotifier.getName();
      final schoolId =
          widget.userLogintoken.userDetails.schoolDetails.school.id;
      final profileImage =
          await profileImageNotifier.getProfileImageBySchoolId(schoolId);

      if (mounted) {
        setState(() {
          _version = version;
          _appName = appName;
          _profileImage = profileImage;
          _screens = [
            HomeSummaryScreen(userLogintoken: widget.userLogintoken),
            CalendarScreen(),
            MyCardScreen(
              userLogintoken: widget.userLogintoken,
              profileImage: _profileImage!,
            ),
          ];
        });
      }
    } catch (e) {
      print("Error initializing app: $e");
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
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

    // Ensure `_screens` is initialized
    if (_screens == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getScreenName(context)),
      ),
      body: SafeArea(
        child: _screens![_selectedScreenIndex], // Use `!` to assert non-null
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        selectedItemColor: context.colorSecondary,
        onTap: (index) {
          if (index >= 0 && index < _screens!.length) {
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
                              : _profileImage != null
                                  ? NetworkImage(
                                      _profileImage!.uri,
                                      headers: {
                                        'Authorization':
                                            'Bearer ${widget.userLogintoken.token}',
                                      },
                                    ) as ImageProvider
                                  : null,
                          // Provide a fallback if _profileImage is null
                          radius: 50,
                        )),
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
            Spacer(),
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
                            _appName,
                            style: const TextStyle(
                              fontSize: 12,
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
                    width: 20, // Adjust width as needed
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
