import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daraz Product Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDetails(),
    );
  }
}

class UserDetails extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<UserDetails> {
  double selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkZD-VsytAMF7-0NASGAtycgVAt5g-6ln4gQ&usqp=CAU',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 16),

              // Product Details
              Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('john.doe@gmail.com'),
              Text('Added On: 2023-12-02 12:23:00'),
              Column(
                children: [
                  SizedBox(height: 16.0), // Add space above the buttons

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle add to cart
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.green, // Set the background color to green
                        ),
                        child: Text('Update'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.red, // Set the background color to red
                        ),
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserReview({
    required String avatarUrl,
    required String username,
    required double rating,
    required String review,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('$rating'),
                ],
              ),
              Text(review),
            ],
          ),
        ],
      ),
    );
  }

  void _showGiveReviewModal(BuildContext context) {
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
                'Give Review',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),

              // Rating Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rating'),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index + 1 <= selectedRating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () {
                          // Handle rating selection
                          setState(() {
                            selectedRating = index + 1.toDouble();
                          });
                        },
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 16.0),

              // Review Input Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Write your review...',
                ),
              ),

              SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  // Handle submit review
                  Navigator.pop(context); // Close the modal
                },
                child: Text('Submit Review'),
              ),
            ],
          ),
        );
      },
    );
  }
}
