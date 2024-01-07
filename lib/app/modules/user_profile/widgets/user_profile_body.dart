// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:lavoro/app/data/model/companyModel.dart';

import '../../../core/utils/helpers/system_helper.dart';
import '../../../data/model/user_model.dart';
import 'custom_header_widget.dart';
import 'custom_profile_listtile.dart';

class UserProfileBody extends StatelessWidget {
  CompanyModel? company;
  bool isnotuser;
  UserProfileBody({
    Key? key,
    this.company,
    
    this.isnotuser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserAccount.info;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          'User information not available.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });

      return const Center(
        child: CircularProgressIndicator(), // or display an error message
      );
    }

    // Extracting selected languages
    List<String> selectedLanguages = user.selectedLanguage;

    return ListView(
      children: <Widget>[
        CustomHeaderWidget(
          isnotuser: isnotuser,
          useraccount: company,
        ),
        CustomProfileListTile(
          label: isnotuser ? company!.username : user.username,
          icons: Icons.text_fields,
          showCopyButton: false,
        ),
        CustomProfileListTile(
          label: isnotuser ? company!.email : user.email,
          icons: Icons.email,
          showCopyButton: true,
        ),
        CustomProfileListTile(
          label: isnotuser ? company!.phoneNumber : user.phoneNumber,
          icons: Icons.phone,
          onTap: () => SystemHelper.makeCall(user.phoneNumber),
        ),
        CustomProfileListTile(
          label: isnotuser ? company!.country : user.country,
          icons: Icons.location_city,
          showCopyButton: false,
        ),
        CustomProfileListTile(
          label: isnotuser ? company!.descrption : user.descrption,
          icons: Icons.description,
          showCopyButton: false,
        ),
        // Displaying selected languages
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                'Programing Languages:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isnotuser
                  ? company!.selectedLanguage.length
                  : selectedLanguages.length,
              itemBuilder: (context, index) {
                return CustomProfileListTile(
                  label: isnotuser
                      ? company!.selectedLanguage[index]
                      : selectedLanguages[index],
                  icons: Icons.language,
                  showCopyButton: false,
                  // Add other properties or actions if needed
                );
              },
            ),
          ],
        ),
        SizedBox(height: Get.height * .1),
      ],
    );
  }
}
