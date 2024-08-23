import 'dart:io';

import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/cubits/sell_vegetables/sell_vegetables_cubit.dart';
import 'package:KrishiKranti/features/login_register/register_screen.dart';
import 'package:KrishiKranti/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SellVegetablesPage extends StatefulWidget {
  const SellVegetablesPage({super.key});

  @override
  _SellVegetablesPageState createState() => _SellVegetablesPageState();
}

class _SellVegetablesPageState extends State<SellVegetablesPage> {
  File? _image;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SellVegetablesCubit(locator.get<ApiService>()),
      child: Builder(builder: (context) {
        return BlocListener<SellVegetablesCubit, SellVegetablesState>(
          listener: (context, state) {
            if (state.status == SellVegetablesStatus.successful) {
              showSuccessSnackbar(context, 'Vegetable added successfully!');
              Navigator.pop(context); // Return to the previous screen
            } else if (state.status == SellVegetablesStatus.error) {
              showErrorSnackbar(
                  context, '${state.errorMessage}. Please try again.');
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Sell Vegetables'),
              backgroundColor: Colors.green,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Vegetable Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _categoryController,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Upload Image'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    ),
                    const SizedBox(height: 10),
                    _image == null
                        ? const Text('No image selected.')
                        : Image.file(_image!),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_image != null) {
                            context.read<SellVegetablesCubit>().sell(
                                  productName: _nameController.text,
                                  productPrice: _priceController.text,
                                  productDescription:
                                      _descriptionController.text,
                                  categoryId: '1',
                                  imagePath: _image!.path,
                                );
                          } else {
                            showErrorSnackbar(context,
                                'Please select an image before submitting.');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
