import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture Placeholder
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 16.0),

            // Username Placeholder
            Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Bio Placeholder
            Text(
              'This is where your bio or description would go.',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),

            // Placeholder for additional settings
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Account Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Placeholder action
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Placeholder action
              },
            ),
          ],
        ),
      ),
    );
  }
}
