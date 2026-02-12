import 'package:flutter/material.dart';
import 'package:fruits_apps_dashboard/core/utils/app_colors.dart';
import 'package:fruits_apps_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_apps_dashboard/features/add_product/presentation/views/widget/custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'is product organic ?',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
  Expanded(child: SizedBox(height: 16,)),
        CustomCheckBox(
          onChecked: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isOrganic,
        ),
        SizedBox(width: 16),
    ],
    );
  }
}
