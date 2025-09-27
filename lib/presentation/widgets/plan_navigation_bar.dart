import 'package:anime_palyer/core/colors.dart';
import 'package:anime_palyer/presentation/screens/payment_plan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanBottomNav extends StatefulWidget {
  const PlanBottomNav({super.key});

  @override
  State<PlanBottomNav> createState() => _PlanBottomNavState();
}

class _PlanBottomNavState extends State<PlanBottomNav> {
  int _selectedIndex = 1;

  final List<_NavItem> _items = [
    _NavItem(icon: Icons.watch_later, label: "preview"),
    _NavItem(icon: Icons.remove_red_eye, label: "Watch Now"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: MyColor.bluePayment,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPlan(),
                ),
              );
            },
            child: Container(
              width: 163,
              height: 44.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: isSelected ? MyColor.purpleMain : MyColor.whitePayment,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(size: 20, item.icon, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    item.label,
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      color: MyColor.white100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
