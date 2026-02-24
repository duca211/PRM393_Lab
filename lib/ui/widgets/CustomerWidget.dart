import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lab_exam/services/GlobalStateService.dart';
import 'package:lab_exam/services/ProductListViewModel.dart';
import 'package:lab_exam/models/Category.dart';
import 'package:lab_exam/models/Product.dart';
import 'package:lab_exam/ui/pages/About.dart';

class Category2Menu extends ConsumerWidget implements PreferredSizeWidget {
  Category2Menu({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      height: preferredSize.height,
      child: PopupMenuButton(
        icon: Icon(Icons.menu),
        onSelected: (valueSelected) {
          //lay ve danh sach san pham thuoc loai san pham duoc chon
          ref
              .read(productListViewModelProvider.notifier)
              .FillByCategory(valueSelected.caId);
          ;
        },
        itemBuilder: (BuildContext context) {
          return CategoryProduct.getCategories().map((category) {
            return PopupMenuItem<CategoryProduct>(
              value: category,
              child: Row(
                children: [
                  category.icon,
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text(category.caName),
                ],
              ),
            );
          }).toList();
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(75.0);
}
