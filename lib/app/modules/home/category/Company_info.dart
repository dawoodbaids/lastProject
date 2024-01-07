import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  final String categoryName;
  final String skill;

  const CompanyInfo({
    Key? key,
    required this.categoryName,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: '$categoryName ',
            style: TextStyle(fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: skill,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
      .collection('users')
      .where('isCompany', isEqualTo: true)
      .where('selectedjobs', isEqualTo: categoryName)
      .where('selectedLanguage', arrayContains: skill)
      .snapshots(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return Center(child: Text('No data found'));
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
          print(userData); 
          return buildUserCard(userData);
        },
      );
    }
  },
),
    );
  }

  Widget buildUserCard(Map<String, dynamic>? userData) {
  if (userData == null || userData.isEmpty) {
    return SizedBox(); // Return an empty container if userData is null or empty
  }

  String username = userData['username'];// Use a default value if 'name' is null
  // String jobDescription = userData['jobDescription'];

  return Card(
    // Customize card appearance and content based on userData
    child: ListTile(
      title: Text(username),
      // subtitle: Text(jobDescription),
      // Add other user details or widgets as needed
    ),
  );
}
}