import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeRange extends StatelessWidget {
  final Function(String) onSelect;

  const AgeRange({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    final ageRanges = [
      "Less Than 18",
      "18-24",
      "24-45",
      "45-60",
      "Above 60",
    ];

    return ListView.separated(
      itemCount: ageRanges.length,
      separatorBuilder: (_, __) => SizedBox(height: 5.h),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(ageRanges[index]),
          onTap: () {
            onSelect(ageRanges[index]);
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }
}
