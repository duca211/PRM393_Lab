import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/services/ProductListViewModel.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  final Product? product; // Nếu có dữ liệu là chế độ Sửa, null là Thêm mới

  const ProductFormScreen({super.key, this.product});

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Widget Input Controllers
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo giá trị ban đầu cho các ô nhập liệu
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '0',
    );
    _descController = TextEditingController(
      text: widget.product?.description ?? '',
    );
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
      // Tạo object Product mới từ dữ liệu Input
      final newProduct = Product(
        id:
            widget.product?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        price: int.parse(
          _priceController.text,
        ), // Chuyển đổi về kiểu int theo model
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

      Navigator.pop(context); // Quay lại trang danh sách
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
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Product Name"),
                validator: (value) => value!.isEmpty ? "Enter a name" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number, // Hiển thị bàn phím số
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
