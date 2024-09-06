import 'package:flutter/material.dart';

import '../../../../core/themes/my_text_style.dart';

class EquipmentListView extends StatelessWidget {
  final List<dynamic> equipmentList;

  const EquipmentListView({super.key, required this.equipmentList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: equipmentList.length,
        itemBuilder: (context, index) {
          final equipment = equipmentList[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.network(
                      equipment.image!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.kitchen);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 80,
                  child: Text(
                    equipment.name!,
                    style: MyTextStyle.serving,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
