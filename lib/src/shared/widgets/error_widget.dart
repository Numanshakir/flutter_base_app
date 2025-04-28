
import 'package:buypass_seller/src/core/theme/app_colors.dart';
import 'package:buypass_seller/src/shared/widgets/text_widget.dart/dm_sns_text.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({super.key, this.message = "Something went wrong"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MdSnsText(message, color: AppColors.colorFAFAFC, fontWeight: FontWeight.w500, size: 16),
    );
  }
}
