import 'package:_3gx_application/backend/erpGetItem.dart';
import 'package:_3gx_application/screens/Toby/item_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InventorySearch extends StatefulWidget {
  const InventorySearch({super.key});

  @override
  _InventorySearchState createState() => _InventorySearchState();
}

class _InventorySearchState extends State<InventorySearch> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> searchItem() async {
    String itemNo = _searchController.text.trim();
    if (itemNo.isEmpty) return;

    final response = await http.get(
      Uri.parse(
          "http://192.168.86.31/3GXInventory/php/search_item.php?item_no=$itemNo"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data != null && data.isNotEmpty) {
        // Ensure this matches your `Item` model
        Item item = Item(
          itemNo: data["Item_No"]?.toString() ?? "",
          itemDesc: data["Item_Desc"]?.toString() ?? "No description available",
          itemPrice: double.tryParse(data["Item_Price"]?.toString() ?? "0.0") ?? 0.0,
          qty: double.tryParse(data["Qty"]?.toString() ?? "0.0") ?? 0.0,
          barcode: data["Barcode"]?.toString() ?? "", // Added missing barcode
          lastOrderDate: _parseDate(data["Last_Order_Date"]),
          dateCreated: _parseDate(data["Date_Created"]),
          dateModified: _parseDate(data["Date_Modified"]), 
          imageFilename: data["Item_Pix_Filename"]?.toString() ?? '',
        );

        // Navigate to ItemDetailsPage with retrieved item
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsPage(item: item, selectedBranch: '', selectedBranchCode: '',),
          ),
        );
      } else {
        _showDialog("Item Not Found", "The item number you entered does not exist.");
      }
    } else {
      _showDialog("Error", "Failed to fetch data. Please try again.");
    }
  }

  DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: "Enter Item No",
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: searchItem, // No need for `() =>`
            ),
          ),
        ),
      ],
    );
  }
}
