import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,color: AppColors.primary,),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Current Location',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Jenin, Palestine',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}