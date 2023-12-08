import 'package:admin/firebase/firebase.dart';
import 'package:admin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _productNameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();

  // For image file
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _imageFile = File(pickedImage.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

// yr firebase pr upload kar rhy ya nodejs ko 
// firestore per
// ye function to firebase me imges upload karny ka nhi ha
  Future<void> _addProduct() async {
    try{
      String url = await Firebase_Functions().uploadPost('images/', DateTime.now().toString()+"pic", _imageFile!);
      
      Utils().showMessageBar(context, url);
      final Map<String, String> Data = {
      'name': _productNameController.text,
      'category': _categoryController.text,
      'price': _priceController.text,
      'stock': _stockController.text,
      'description': _descriptionController.text,
      'image': url
      };
      await Firebase_Functions().addDataToFirestore(Data);
    }
    catch(error){
      print(error);
    }
    // try {
    //   var request = http.MultipartRequest(
    //     'POST',
    //     Uri.parse('http://localhost:4000/addProducts'),
    //   );

    //   request.fields['productName'] = _productNameController.text;
    //   request.fields['category'] = _categoryController.text;
    //   request.fields['price'] = _priceController.text;
    //   request.fields['stock'] = _stockController.text;
    //   request.fields['description'] = _descriptionController.text;

    //   if (_imageFile != null) {
    //     var stream = http.ByteStream(_imageFile!.openRead());
    //     var length = await _imageFile!.length();

    //     var multipartFile = http.MultipartFile(
    //       'image',
    //       stream,
    //       length,
    //       filename: _imageFile!.path.split('/').last,
    //     );

    //     request.files.add(multipartFile);
    //   }

    //   final response = await request.send();

    //   if (response.statusCode == 200) {
    //     print('Product added successfully');
    //   } else {
    //     print('Error adding product. Status code: ${response.statusCode}');
    //     print('Response body: ${await response.stream.bytesToString()}');
    //   }
    // } catch (e) {
    //   print('Error adding product: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _imageFile != null
                        ? Image.file(_imageFile!)
                        : Container(),
                  ),
                  _imageFile == null
                      ? Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _stockController,
              decoration: InputDecoration(labelText: 'Stock'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addProduct();
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
  
  Data({required String name, required String category, required String price, required String stock, required String description, required String image}) {}
}

