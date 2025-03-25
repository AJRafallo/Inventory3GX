import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, String>>> fetchBranchNames() async {
  final response = await http.get(Uri.parse('http://10.0.2.2/3GXInventory/php/get_branches.php'));

  if (response.statusCode == 200) {
    // Parse the response body
    List<dynamic> data = jsonDecode(response.body); 
    List<Map<String, String>> branches = [];
    
    // Loop through the response and extract branch name and branch code
    for (var item in data) {
      branches.add({
        'BranchName': item['BranchName'],  // Branch name
        'BranchCode': item['BranchID'],  // Branch code
      });
    }
    
    return branches;
  } else {
    throw Exception('Failed to load branches');
  }
}