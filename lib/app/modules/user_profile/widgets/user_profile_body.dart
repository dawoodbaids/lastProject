import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/core/utils/helpers/system_helper.dart';
import 'package:lavoro/app/data/model/companyModel.dart';
import 'package:lavoro/app/data/model/user_model.dart';
import 'package:lavoro/app/modules/user_profile/widgets/custom_profile_listtile.dart';
import 'package:lavoro/app/modules/user_profile/widgets/job_post.dart';

import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/text_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/user_profile_controller.dart';
import 'custom_header_widget.dart';

class UserProfileBody extends StatelessWidget {
  final UserProfileController _userProfileController =
      Get.put(UserProfileController());

  final CompanyModel? company;
  final bool isnotuser;

  UserProfileBody({
    Key? key,
    required this.company,
    this.isnotuser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserAccount.info;
    if (user == null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Get.snackbar(
          'Error',
          'User information not available.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });

      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    List<String> selectedLanguages = user.selectedLanguage;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomHeaderWidget(
            isnotuser: isnotuser,
            useraccount: company,
          ),
          const SizedBox(height: 20),
          CustomProfileListTile(
            label: isnotuser ? company!.username : user.username,
            icons: Icons.text_fields,
            showCopyButton: false,
          ),
          const SizedBox(height: 20),
          CustomProfileListTile(
            label: isnotuser ? company!.email : user.email,
            icons: Icons.email,
            showCopyButton: true,
          ),
          const SizedBox(height: 20),
          CustomProfileListTile(
            label: isnotuser ? company!.phoneNumber : user.phoneNumber,
            icons: Icons.phone,
            onTap: () => SystemHelper.makeCall(user.phoneNumber),
          ),
          const SizedBox(height: 20),
          CustomProfileListTile(
            label: isnotuser ? company!.country : user.country,
            icons: Icons.location_city,
            showCopyButton: false,
          ),
          const SizedBox(height: 20),
          CustomProfileListTile(
            label: isnotuser ? company!.descrption : user.descrption,
            icons: Icons.description,
            showCopyButton: false,
          ),
          const SizedBox(height: 20),
          CustomProfileListTile(
            label: isnotuser ? company!.selectedjobs : user.selectedjobs,
            icons: Icons.work,
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
              SizedBox(height: 17,),
              CustomButton(
                label: "Edit Information",
                icons: Icons.edit,
                onPressed: () {
    Get.toNamed(Routes.EDIT_INFO);


                  // _userProfileController.updateUserInFirestore(
                  //   newUsername: 'New Username',
                  //   newSelectedJobs: 'New Selected Job',
                  //   newPhoneNumber: 'New Phone Number',
                  //   newJobDescription: 'New Job Description',
                  //   newProgrammingLanguages: ['Dart', 'Python'],
                  //   newSelectedLanguage: 'English',
                  //   newExperince: 'New Experience',
                  // );
                },
              ),
SizedBox(height: 17,),
              // Other CustomProfileListTile widgets...
              const Divider(color: Color.fromRGBO(0, 0, 0, 1), height: 12, thickness: 2),
             
                if (user.isCompany == true)
                 Text(
                      "                                   Posts  ",
                      textAlign: TextAlign.center,
                      style: AppStyles.headLine1.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                 const Divider(color: Colors.black, height: 12, thickness: 2),
                  if (user.isCompany == true) 
              JobPosting(userId: UserAccount.info!.uid),
            ],
          ),
        ],
      ),
    );
  }
}
