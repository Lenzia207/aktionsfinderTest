import 'package:flutter/material.dart';
import 'package:marq_app/widget/skeleton_screens/shimmer_widget.dart';

class AktionCardsShimmer extends StatelessWidget {
  const AktionCardsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AspectRatio(
              aspectRatio: 1 / 1.5,
              child: ShimmerWidget.rectangular(height: 200),
            ),
            const SizedBox(height: 10),
            const ShimmerWidget.rectangular(
              width: 70,
              height: 15,
            ),
            const SizedBox(height: 5),
            const ShimmerWidget.rectangular(
              width: 60,
              height: 15,
            ),
            const SizedBox(height: 22),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ShimmerWidget.rectangular(
                    width: 60,
                    height: 10,
                  ),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: Color.fromARGB(255, 223, 223, 223),
                    size: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
