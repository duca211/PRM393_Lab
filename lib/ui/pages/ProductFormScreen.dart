import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/models/Category.dart';
import 'package:lab_exam/services/ProductListViewModel.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  final Product? product;

  const ProductFormScreen({super.key, this.product});

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState(); // Tên ở đây...
}

// ...Phải khớp với tên ở đây
class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descController;

  String? _selectedCaId;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '0',
    );
    _descController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    _selectedCaId = widget.product?.caId ?? 'ca01';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = Product(
        id:
            widget.product?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        caId: _selectedCaId!,
        name: _nameController.text,
        price: int.parse(_priceController.text),
        description: _descController.text,
        imageUrl: widget.product?.imageUrl ?? "assets/images/avatar7.jpg",
        isFavorite: widget.product?.isFavorite ?? false,
      );

      final viewModel = ref.read(productListViewModelProvider.notifier);

      if (widget.product == null) {
        viewModel.addProduct(newProduct);
      } else {
        viewModel.updateProduct(newProduct);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? "Add Product" : "Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedCaId,
                decoration: const InputDecoration(labelText: "Category"),
                items: CategoryProduct.getCategories().map((category) {
                  return DropdownMenuItem(
                    value: category.caId,
                    child: Row(
                      children: [
                        category.icon,
                        const SizedBox(width: 10),
                        Text(category.caName),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCaId = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Select a category" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Product Name"),
                validator: (value) => value!.isEmpty ? "Enter a name" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number,
                validator: (value) => int.tryParse(value!) == null
                    ? "Enter a valid number"
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text("Save Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
