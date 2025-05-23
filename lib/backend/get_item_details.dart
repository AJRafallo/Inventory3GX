/*import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<Item>> fetchItems() async {
  final response = await http.get(Uri.parse('http://192.168.86.36/3GXInventory/php/get_item_details.php'));

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (responseData["status"] == "success" && responseData["data"] is List) {
      List<dynamic> itemList = responseData["data"];
      return itemList.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception("No items found or invalid response format");
    }
  } else {
    throw Exception("Failed to load items");
  }
}

class Items {
  final String itemNo;
  final String itemDesc;
  final double itemPrice;
  final double qty;
  final String barcode;
 
  final DateTime? lastOrderDate;
  final DateTime? dateCreated;
  final DateTime? dateModified; // Included DateModified
  final String? itemPixFilename;

  Item({
    required this.itemNo,
    required this.itemDesc,
    required this.itemPrice,
    required this.qty,
    required this.barcode,
   
    this.lastOrderDate,
    this.dateCreated,
    this.dateModified,
    this.itemPixFilename,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(dynamic value) {
      if (value == null || value.toString().isEmpty) return null;
      if (value is int) {
        return DateTime.fromMillisecondsSinceEpoch(value);
      } else {
        return DateTime.tryParse(value.toString());
      }
    }

    return Item(
      itemNo: json['Item_No'] ?? '',
      itemDesc: json['Item_Desc'] ?? '',
      itemPrice: json['Item_Price'] != null ? double.tryParse(json['Item_Price'].toString()) ?? 0.0 : 0.0,
      qty: json['Qty'] != null ? double.tryParse(json['Qty'].toString()) ?? 0.0 : 0.0,
      barcode: json['Barcode'] ?? '',
      itemPixFilename: json['Item_Pix_Filename'] ?? '',
      lastOrderDate: parseDate(json['Last_Order_Date']),
      dateCreated: parseDate(json['DateCreated']),
      dateModified: parseDate(json['DateModified']),
    );
  }
}



*/