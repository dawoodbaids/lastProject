// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class EmpCardView extends StatefulWidget {
  const EmpCardView({Key? key}) : super(key: key);

  @override
  _MyCardView createState() => _MyCardView();
}

class _MyCardView extends State<EmpCardView> {
 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/dawood.jpg'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: Dawood',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'City: maan',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Job: Python',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Experince: 0-5 year',
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
            thickness: 2,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'A beginner in a front-end job typically works on creating the visible parts of websites or apps that users interact with. They learn to use languages like HTML, CSS, and JavaScript to build layouts, style elements, and add interactive features. Their tasks might include crafting basic web pages, understanding how to make designs responsive, and starting to grasp how different elements work together to create a cohesive user experience',
              style: TextStyle(fontSize: 16),
            ),
          ),
        
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(12.0),
           
          ),
        ],
      ),
    );
  }
}
