import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';

// Sidebar material
class Sidebar extends StatefulWidget {
  final Function(String) onNavigate;
  final List<DrawerItem> items;

  Sidebar({required this.onNavigate, required this.items});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110, // Set the width of the sidebar here
      child: Drawer(
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: widget.items.map((item) {
            return ListTile(
              title: Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      item.image,
                      width: 40, // Adjust the width as needed
                      height: 40, // Adjust the height as needed
                    ),
                    SizedBox(height: 5),
                    Text(
                      item.title,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              onTap: () {
                // Pass the selected title directly to the callback
                widget.onNavigate(item.title);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final String image;

  DrawerItem({required this.title, required this.image});
}
