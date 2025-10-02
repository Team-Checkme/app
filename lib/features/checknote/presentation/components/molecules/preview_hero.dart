import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';

class PreviewHero extends StatelessWidget {
  const PreviewHero({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFE6F1FF),
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
      ),
      alignment: Alignment.center,
      child: imageUrl == null
          ? const Icon(Icons.image, color: AppColors.gray300, size: 48)
          : const SizedBox.shrink(),
    );
  }
}
