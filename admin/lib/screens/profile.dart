import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daraz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Avatar
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYetfo0Z9tnauj3LQ-Cj7xCvaN_L8svM3Yw6SK-btVLTEQvY7Ih5hob5P1lUgLWtqvPlg&usqp=CAU',
                    ),
                  ),
                ],
              ),
            ),

            // Profile Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: John Doe',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Email: john.doe@example.com',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),

            // Edit Profile Button with Padding
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Open edit modal
                  _showEditProfileModal(context);
                },
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the edit profile modal
  void _showEditProfileModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),

              // Image Upload Option
              ElevatedButton(
                onPressed: () {
                  // Handle image upload
                },
                child: Text('Upload Profile Image'),
              ),
              SizedBox(height: 16.0),

              // Change Name Option
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Change Name',
                ),
              ),
              SizedBox(height: 16.0),

              // Change Email Option
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Change Email',
                ),
              ),
              SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  // Handle save changes
                  Navigator.pop(context); // Close the modal
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        );
      },
    );
  }
}
