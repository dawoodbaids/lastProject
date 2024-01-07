// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lavoro/app/data/model/companyModel.dart';

import 'package:lavoro/app/data/model/job_model.dart';
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
  Widget build(BuildContext context) {
    print(widget.job.companyId);
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
                    Get.to(UserProfileView(
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
                        'Name: ${widget.job.title}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'City: ${widget.company.country}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Interests: ${widget.job.selectedLanguage}',
                        style: TextStyle(fontSize: 16),
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
            color: Colors.grey,
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
            thickness: 1,
            color: Colors.black,
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 12,
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
