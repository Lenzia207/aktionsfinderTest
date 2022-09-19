import 'package:flutter/material.dart';
import 'package:marq_app/widget/skeleton_screens/shimmer_widget.dart';

class MainPageShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShimmerWidget.rectangular(height: 200),
        Stack(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            width: double.infinity,
            color: Colors.white,
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Row(children: [
              ShimmerWidget.circular(
                height: 30,
                width: 50,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ShimmerWidget.circular(
                height: 30,
                width: 100,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ShimmerWidget.circular(
                height: 30,
                width: 80,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ShimmerWidget.circular(
                height: 30,
                width: 150,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
            ]),
          ),
        ]),
      ],
    );
  }
}
