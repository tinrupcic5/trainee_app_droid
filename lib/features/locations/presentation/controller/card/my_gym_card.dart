import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/core/style/colors.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/CardModel.dart';
import 'package:intl/intl.dart';
import '../../assets.dart' as app_assets;

class MyGymCard extends StatefulWidget {
  const MyGymCard(
      {super.key, required this.userLogintoken, required this.profileImage});

  final UserLoginResponse userLogintoken;
  final ProfileImage profileImage;

  @override
  State<MyGymCard> createState() => _MyGymCardState();
}

class _MyGymCardState extends State<MyGymCard> {
  late CardModel cardModel;

  @override
  void initState() {
    super.initState();
    cardModel = createCustomCardModel(
      widget.userLogintoken.userDetails.schoolDetails.school.schoolName,
      "${widget.userLogintoken.userDetails.name} ${widget.userLogintoken.userDetails.lastName}",
      widget.userLogintoken.userDetails.phoneNumber!,
      "",
      parseStringToDate(widget.userLogintoken.userDetails.user.createdAt),
      widget.userLogintoken.userDetails.schoolDetails.schoolLocation,
    );
  }

  String parseStringToDate(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSSSS');
    final DateTime dateTime = inputFormat.parse(dateString);
    final outputFormat = DateFormat('dd.MM.yyyy');
    return outputFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.blueCardColor,
              CustomColors.purpleCardColor.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    cardModel.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                SizedBox(
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                  child: Image.network(
                    widget.profileImage.uri,
                    headers: {
                      'Authorization': 'Bearer ${widget.userLogintoken.token}',
                    },
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    cardModel.userName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cardModel.phoneNumber.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cardModel.location,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 8),
                  const SizedBox(height: 8),
                  Text(
                    context.memberSince +
                        " " +
                        cardModel.createdAt.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 22),
                const Spacer(),
                FutureBuilder<Widget>(
                  future: buildQrCodeContainer(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return snapshot.data ?? Container();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> buildQrCodeContainer() async {
    final qrData = await SharedPrefsManager().getQrCodeFromLocalCache();
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: QrImageView(
            data: qrData, // Make sure to add qrData to UserDetails
            version: QrVersions.auto,
            size: 160.0,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
