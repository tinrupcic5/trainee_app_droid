// home_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/core/style/style_extensions.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/common/presentation/widget/home_drawer.dart';
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
  List<Widget>? _screens;

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
    if (_screens == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getScreenName(context)),
      ),
      body: SafeArea(
        child: _screens![_selectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.colorBackground,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: context.colorError,
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
      drawer: DrawerWidget(
        userLoginResponse: widget.userLogintoken,
        profileImage: _profileImage,
        selectedImage: _selectedImage,
        onScreenSelected: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        onLogout: _logout,
        appName: _appName,
        version: _version,
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
