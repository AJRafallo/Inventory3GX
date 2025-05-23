/*class Item {
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
    this.itemPixFilename
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
      itemPixFilename: json['itemPixFilename'] ?? '',
      
      lastOrderDate: parseDate(json['Last_Order_Date']),
      dateCreated: parseDate(json['DateCreated']),
      dateModified: parseDate(json['DateModified']),
    );
  }
}*/