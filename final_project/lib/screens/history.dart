import 'package:flutter/material.dart';
import './cart.dart';
import './buy.dart';
import './profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daraz Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartScreen(),
    );
  }
}

class BuyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy History'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product 1
            buildCartItem(
              productName: 'Product 1',
              imageUrl:
                  'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXNzJTIwc3VpdHxlbnwwfHwwfHx8MA%3D%3D',
              price: '\$19.99',
              quantity: 2,
            ),

            // Product 2
            buildCartItem(
              productName: 'Product 2',
              imageUrl:
                  'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/22173926/2023/3/1/e6fe9a99-6dad-4482-84b7-8e695aa4298d1677652489257KID1BlueFloralNetMaxiDress1.jpg',
              price: '\$29.99',
              quantity: 1,
            ),

            // Total Price
            SizedBox(height: 16),
            Text(
              'Total Price: \$69.97',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Checkout Button
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Buy History',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item taps
          if (index == 1) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
          if (index == 2) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          if (index == 3) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuyHistory()),
            );
          }
        },
      ),
    );
  }

  Widget buildCartItem({
    required String productName,
    required String imageUrl,
    required String price,
    required int quantity,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(
          imageUrl,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(productName),
        subtitle: Text('Total Price: $price\nQuantity: $quantity'),
      ),
    );
  }
}
