import 'package:anime_palyer/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FancyBottomNav extends StatefulWidget {
  const FancyBottomNav({super.key});

  @override
  State<FancyBottomNav> createState() => _FancyBottomNavState();
}

class _FancyBottomNavState extends State<FancyBottomNav> {
  int _selectedIndex = 0;

  final List<_NavItem> _items = [
    _NavItem(icon: Icons.home, label: "Home"),
    _NavItem(icon: Icons.star, label: "Favorites"),
    _NavItem(icon: Icons.search_rounded, label: "Search"),
    _NavItem(icon: Icons.person, label: "Profile"),
    _NavItem(icon: Icons.settings, label: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              // width: 99,
              // height: 34,
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 14 : 0,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: isSelected ? MyColor.purpleMain : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(
                    size: 20,
                    item.icon,
                    color: isSelected ? MyColor.white100 : MyColor.whiteGray100,
                  ),
                  if (isSelected) ...[
                    const SizedBox(width: 8),
                    Text(
                      item.label,
                      style: GoogleFonts.raleway(
                        fontSize: 14,
                        color: MyColor.white100,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  _NavItem({required this.icon, required this.label});
}
