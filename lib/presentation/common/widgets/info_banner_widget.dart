import 'package:bus_flow_admin/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Center content
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // Icon(Icons.directions_bus, color: Colors.white, size: 32),
                SizedBox(width: 8),
                Text(
                  "Rs. 25000",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Label inside top-left corner
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                // color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Yesterday's Earnings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
