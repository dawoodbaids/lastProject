// ... other imports

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/modules/emp_home/widgets/card_view.dart';

import '../../../global_widgets/adv.dart';
import '../../../global_widgets/text_theme.dart';
import '../../home/category/lang.dart';
import '../emp_category/jobs_it.dart';


class EmpHomeBody extends StatelessWidget {
  const EmpHomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Divider(
            height: 0,
            thickness: 10,
            color: Colors.black,
          ),
            
          CarouselSection(),
          SizedBox(height: 20),
           Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
            SizedBox(height: 10),
          Text(
            "    Information Technology Jobs",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
            
            textAlign: TextAlign.start,
          ),
            SizedBox(height: 10),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
            SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: EmpCategoriesRow(),
          ),
          
          SizedBox(height: 15),
           Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
            SizedBox(height: 20),
          Text(
            "        Employee IN Application",
            style: AppStyles.headLine3.copyWith(
              color: Get.theme.colorScheme.onBackground,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20,),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
            
          ),
          
          // Use ListView.builder to display multiple CardViews
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                10, 
                // Replace with the actual number of cards you want to display
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: EmpCardView(),
              );
            },
          ),
        ],
      ),
    );
  }
}
