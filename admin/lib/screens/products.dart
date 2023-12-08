
import 'package:admin/firebase/firebase.dart';
import 'package:admin/utils/utils.dart';
import 'package:flutter/material.dart';
import './addproduct.dart';
import './products.dart';
import './productdetail.dart';

class Productpage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<Productpage> {
  final Firebase_Functions firebaseFunctions = Firebase_Functions();
  List<Map<String, dynamic>> productList = [];
  Future<void> ProductDelete(id) async {
    try {
      await firebaseFunctions.deleteProduct(id);
      Utils().showMessageBar(context, "Data fetched successfully.");
    } catch (error) {
      print(error);
      Utils().showMessageBar(context, "Error fetching data: $error");
    }
  }

  Future<void> getProducts() async {
    try {
      productList = await firebaseFunctions.getMoreProduct();
      Utils().showMessageBar(context, "Data fetched successfully.");
    } catch (error) {
      print(error);
      Utils().showMessageBar(context, "Error fetching data: $error");
    }
    setState(() {}); // Update UI after fetching data
  }

  @override
  void initState() {
    super.initState();
    getProducts(); // Fetch data when the page is loaded
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add Product Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProductScreen()),
                  );
                },
                child: Text('Add Product'),
              ),

              SizedBox(height: 16.0),

              // Product Cards
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return ProductCard(
                    imageUrl: product['image'],
                    productName: product['name'],
                    productPrice: product['price'],
                  );
                  
                },
                
              ),
              
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.black,
      //   showUnselectedLabels: true,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Products',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.people),
      //       label: 'Users',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Firebase_Functions firebaseFunctions = Firebase_Functions();
  // Future<void> ProductDelete(id) async {
  //   try {
  //     await firebaseFunctions.deleteProduct(id);
  //     // Utils().showMessageBar(context, "Data fetched successfully.");
  //   } catch (error) {
  //     print(error);
  //     // Utils().showMessageBar(context, "Error fetching data: $error");
  //   }
  // }
Future<void> ProductDelete(String id) async {
  try {
    await firebaseFunctions.deleteProduct(id);
    print("Deleted");
  } catch (error) {
    print("Error deleting: $error");
    // Handle error message display or any other action.
  }
}
  final String imageUrl;
  final String productName;
  final String productPrice;

  ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with error widget
          Image(
            image: NetworkImage(imageUrl),
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  productPrice,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8.0), // Add space between price and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Functionality for the first button
                      },
                      child: Text('Update'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      // ProductDelete(product['id'].toString());
                      ProductDelete("a6Zwep40XuwEvFKtVe1u");
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
