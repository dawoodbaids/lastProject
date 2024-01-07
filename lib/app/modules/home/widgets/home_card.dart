// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import, unnecessary_import, unnecessary_string_interpolations, must_be_immutable
// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lavoro/app/data/model/companyModel.dart';

import 'package:lavoro/app/data/model/job_model.dart';
import 'package:lavoro/app/modules/company_profile/compant_profile_view.dart';
import 'package:lavoro/app/modules/user_profile/view/user_profile_view.dart';

class MyCardView extends StatefulWidget {
  CreateJobAcount job;
  CompanyModel company;
  MyCardView({
    Key? key,
    required this.job,
    required this.company,
  }) : super(key: key);

  @override
  _MyCardView createState() => _MyCardView();
}

class _MyCardView extends State<MyCardView> {
  @override
      bool isDataAvailable = false;
  void initState() {
    super.initState();
    checkDataAvailability();
  }

  void checkDataAvailability() {
    // Check if company's selected languages match job's selected languages
    bool languagesMatch =
        widget.company.selectedLanguage.contains(widget.job.selectedLanguage);

    // Check if company's selected jobs match job's selected jobs
    bool jobsMatch = widget.company.selectedjobs.contains(widget.job.selectedjobs);

    setState(() {
      // Set isDataAvailable to true if either condition is met
      isDataAvailable = languagesMatch || jobsMatch;
    });
  }
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.job.companyId);
    }
  
     if (isDataAvailable) {
     
    return Card(
      borderOnForeground: true,
      elevation: 100,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(CompanyProfileView(
                      company: widget.company,
                      isnotuser: true,
                    ));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.company.imageUrl),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${widget.company.username}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
                      Text(
                        ' ${widget.job.title}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        
                      ),
                         Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
                           SizedBox(height: 4),
                      Text(
                        ': ${widget.job.selectedjobs}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        
                      ),
                      SizedBox(height: 4),
                       Divider(
            height: 0,
            thickness: 1,
          ),
                      Text(
                        'programing languges that job need : ${widget.job.selectedLanguage}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        
                      ),
                      
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
         Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.job.jobdescription}',
              style: TextStyle(fontSize: 16),
              
            ),
            
          ),
          Divider(
            height: 0,
            thickness: 2,
            color: Colors.black,
            

          ),
        ],
      ),
    );
    
  }
  else {
      return  Container();
    }
  }
}

