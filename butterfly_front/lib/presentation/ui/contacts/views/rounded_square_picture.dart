// rounded corners square picture widget
import 'package:butterfly_front/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:look/look.dart';

@Look('roundedSquarePictureSample')
class RoundedSquarePicture extends StatelessWidget {
  const RoundedSquarePicture({
    super.key,
    required this.url,
    this.size = 48,
    this.borderRadius = 8,
  });

  final String url;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          color: ButterflyColors.secondary,
          borderRadius: BorderRadius.circular(borderRadius),
          // add border
          border: Border.all(
            color: ButterflyColors.primary,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              url,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

roundedSquarePictureSample() => const Scaffold(
      body: Center(
        child: RoundedSquarePicture(
          url: 'https://picsum.photos/800/800',
          size: 512,
          borderRadius: 128,
        ),
      ),
    );
