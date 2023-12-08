import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './details.dart';
import './cart.dart';
import './profile.dart';
import './history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapShot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                    child: Text(snapShot.data!.docs[index]['name']),
                  ),
                );
              },
            );
          }),
      // body: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       // Search Bar
      //       Container(
      //         padding: EdgeInsets.all(16.0),
      //         color: Colors.orange,
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //             hintText: 'Search for products...',
      //             prefixIcon: Icon(Icons.search),
      //             filled: true,
      //             fillColor: Colors.white,
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10.0),
      //               borderSide: BorderSide.none,
      //             ),
      //           ),
      //         ),
      //       ),

      //       // Banner Image
      //       Image.network(
      //         'https://static.vecteezy.com/system/resources/thumbnails/004/707/493/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-vector.jpg',
      //         height: 200.0,
      //         fit: BoxFit.cover,
      //       ),
      //       // Categories
      //       SectionHeader('Categories'),
      //       SizedBox(height: 8.0),
      //       SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             for (int i = 1; i <= 9; i++)
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => ProductDetailsScreen()),
      //                   );
      //                 },
      //                 child: TrendingProductWidget(
      //                   imageUrl:
      //                       'https://media.istockphoto.com/id/489814272/photo/gold-silver-rings-and-chains.jpg?s=612x612&w=0&k=20&c=d8tGqzlmqMZzhcYmgE_OyDNSQ9dAdo-T3BwdaSsDbhs=',
      //                   name: 'Product $i',
      //                   price: '\$19.99',
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ),

      //       // Featured Products
      //       SectionHeader('Featured Products'),
      //       SizedBox(height: 8.0),
      //       SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             for (int i = 1; i <= 9; i++)
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => ProductDetailsScreen()),
      //                   );
      //                 },
      //                 child: TrendingProductWidget(
      //                   imageUrl:
      //                       'https://images.unsplash.com/photo-1594938328870-9623159c8c99?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1c2luZXNzJTIwc3VpdHxlbnwwfHwwfHx8MA%3D%3D',
      //                   name: 'Product $i',
      //                   price: '\$19.99',
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ),
      //       // Flash Sales
      //       SectionHeader('Flash Sales'),
      //       SizedBox(height: 8.0),
      //       SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             for (int i = 1; i <= 9; i++)
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => ProductDetailsScreen()),
      //                   );
      //                 },
      //                 child: TrendingProductWidget(
      //                   imageUrl:
      //                       'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/22173926/2023/3/1/e6fe9a99-6dad-4482-84b7-8e695aa4298d1677652489257KID1BlueFloralNetMaxiDress1.jpg',
      //                   name: 'Product $i',
      //                   price: '\$19.99',
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ),

      //       // Trending Products
      //       SectionHeader('Trending Products'),
      //       SizedBox(height: 8.0),
      //       SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             for (int i = 1; i <= 9; i++)
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => ProductDetailsScreen()),
      //                   );
      //                 },
      //                 child: TrendingProductWidget(
      //                   imageUrl:
      //                       'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXNzJTIwc3VpdHxlbnwwfHwwfHx8MA%3D%3D',
      //                   name: 'Product $i',
      //                   price: '\$19.99',
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
    );
  }
}

class TrendingProductWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  TrendingProductWidget(
      {required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl,
              height: 150.0, width: 150.0, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.0),
                Text(price,
                    style: TextStyle(fontSize: 14.0, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
