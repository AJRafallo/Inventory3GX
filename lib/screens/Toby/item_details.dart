import 'package:_3gx_application/backend/erpGetItem.dart';
import 'package:_3gx_application/backend/erpInsertCount.dart';
import 'package:_3gx_application/screens/Toby/design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailsPage extends StatefulWidget {
  final Item item;
  final String selectedBranch;
  final String selectedBranchCode;

  ItemDetailsPage({
    required this.item,
    required this.selectedBranch,
    required this.selectedBranchCode,
  });

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  TextEditingController countController = TextEditingController();
  bool _showDatabaseCount = false; // Changed default to false for security

  // Add this password dialog function
  Future<String?> _showPasswordDialog(BuildContext context) async {
    TextEditingController passwordController = TextEditingController();

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Password', style: GoogleFonts.poppins()),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: GoogleFonts.poppins()),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(passwordController.text);
              },
              child: Text('OK', style: GoogleFonts.poppins()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: isSmallScreen ? 5.0 : 5.0,
            left: isSmallScreen ? 70.0 : 70.0,
            right: isSmallScreen ? 70.0 : 70.0,
            bottom: isSmallScreen ? 20.0 : 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isSmallScreen ? 10 : 24),

              // Display Selected Branch
              ItemDetailsDesign.buildSectionHeader("Selected Branch",
                  icon: Icons.store),
              ItemDetailsDesign.buildInfoCard(
                children: [
                  ItemDetailsDesign.buildInfoRow(
                    "Branch",
                    widget.selectedBranch,
                    icon: Icons.business,
                    isSmallScreen: isSmallScreen,
                  ),
                ],
              ),
              SizedBox(height: isSmallScreen ? 16 : 24),

              // Item Information Section
              Text(
                "Item Description",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 10),

              ItemDetailsDesign.buildSectionHeader(widget.item.itemDesc),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "SKU/Item No.: ",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: widget.item.itemNo,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ItemDetailsDesign.buildInfoCard(
                children: [
                  ItemDetailsDesign.buildInfoRow(
                      "Price", "\$${widget.item.itemPrice.toStringAsFixed(2)}",
                      icon: Icons.attach_money, isSmallScreen: isSmallScreen),
                  ItemDetailsDesign.buildInfoRow("Barcode", widget.item.barcode,
                      icon: Icons.qr_code, isSmallScreen: isSmallScreen),
                  ItemDetailsDesign.buildInfoRow(
                      "Last Order Date",
                      widget.item.lastOrderDate != null
                          ? "${widget.item.lastOrderDate!.toLocal().year}-${widget.item.lastOrderDate!.toLocal().month.toString().padLeft(2, '0')}-${widget.item.lastOrderDate!.toLocal().day.toString().padLeft(2, '0')}"
                          : "N/A",
                      icon: Icons.calendar_today,
                      isSmallScreen: isSmallScreen),
                  ItemDetailsDesign.buildInfoRow(
                      "Date Created",
                      widget.item.dateCreated != null
                          ? "${widget.item.dateCreated!.toLocal().year}-${widget.item.dateCreated!.toLocal().month.toString().padLeft(2, '0')}-${widget.item.dateCreated!.toLocal().day.toString().padLeft(2, '0')}"
                          : "N/A",
                      icon: Icons.date_range,
                      isSmallScreen: isSmallScreen),
                  ItemDetailsDesign.buildInfoRow(
                      "Date Modified",
                      widget.item.dateModified != null
                          ? "${widget.item.dateModified!.toLocal().year}-${widget.item.dateModified!.toLocal().month.toString().padLeft(2, '0')}-${widget.item.dateModified!.toLocal().day.toString().padLeft(2, '0')}"
                          : "N/A",
                      icon: Icons.edit,
                      isSmallScreen: isSmallScreen),
                ],
              ),

              SizedBox(height: isSmallScreen ? 16 : 24),

              // Modified Database count with password protection
              ItemDetailsDesign.buildSectionHeader("Branch Count",
                  icon: Icons.inventory),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item count in ${widget.selectedBranch} branch.",
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text("Show", style: GoogleFonts.poppins(fontSize: 12)),
                      Switch(
                        value: _showDatabaseCount,
                        onChanged: (value) async {
                          if (value) {
                            String? password =
                                await _showPasswordDialog(context);
                            if (password == '3GXSolutions!') {
                              setState(() {
                                _showDatabaseCount = true;
                              });
                            } else if (password != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Incorrect password!',
                                      style: GoogleFonts.poppins()),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } else {
                            setState(() {
                              _showDatabaseCount = false;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              if (_showDatabaseCount)
                FutureBuilder<int>(
                  future: fetchInventoryBranchCount(
                      widget.item.itemNo, widget.selectedBranchCode),
                  builder: (context, snapshot) {
                    return ItemDetailsDesign.buildInfoCard(
                      children: [
                        ItemDetailsDesign.buildInfoRow(
                          "Count",
                          snapshot.data?.toString() ?? "0",
                          icon: Icons.format_list_numbered,
                          valueStyle: GoogleFonts.lato(
                            fontSize: isSmallScreen ? 16 : 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                          isSmallScreen: isSmallScreen,
                        ),
                      ],
                    );
                  },
                ),

              SizedBox(height: 10),

              SizedBox(height: isSmallScreen ? 16 : 24),

              // Rest of the code remains unchanged...
              ItemDetailsDesign.buildSectionHeader("Current Count",
                  icon: Icons.inventory),
              Text(
                "Item count to be added to ${widget.selectedBranch} branch.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder<int>(
                future:
                    fetchCount(widget.item.itemNo, widget.selectedBranchCode),
                builder: (context, snapshot) {
                  return ItemDetailsDesign.buildInfoCard(
                    children: [
                      ItemDetailsDesign.buildInfoRow(
                        "Count",
                        snapshot.data?.toString() ?? "0",
                        icon: Icons.format_list_numbered,
                        valueStyle: GoogleFonts.lato(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                        isSmallScreen: isSmallScreen,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: isSmallScreen ? 16 : 24),

              ItemDetailsDesign.buildSectionHeader("Your Count",
                  icon: Icons.edit),
              Text(
                "Enter your current Count.",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 10),
              ItemDetailsDesign.buildCountInputField(
                controller: countController,
                isSmallScreen: isSmallScreen,
              ),
              SizedBox(height: isSmallScreen ? 24 : 32),

              ItemDetailsDesign.buildAddButton(
                onPressed: _addInventoryCount,
                isSmallScreen: isSmallScreen,
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  void _addInventoryCount() async {
    if (countController.text.isNotEmpty) {
      await addInventoryCount(
        widget.item.itemNo,
        widget.selectedBranch,
        double.tryParse(countController.text) ?? 0.0,
        'current_user',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Count added successfully!',
            style: GoogleFonts.lato(),
          ),
          backgroundColor: Colors.green,
        ),
      );

      countController.clear();
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter a count',
            style: GoogleFonts.lato(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
