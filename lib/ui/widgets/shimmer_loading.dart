import 'package:flutter/material.dart';

import 'shimmer/skeleton_shimmer.dart';

class ShimmerSkelton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Skeleton(height: 60, width: 60),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Skeleton(width: 80, height: 10),
                const SizedBox(height: 16.0 / 2),
                Row(
                  children: [
                    const Skeleton(
                      width: 100,
                      height: 20,
                    ),
                    Spacer(),
                    Skeleton(height: 20, width: 50)
                  ],
                ),
                const SizedBox(height: 16.0 / 2),
                Row(
                  children: const [
                    Skeleton(
                      height: 20,
                      width: 120,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailImageSkelton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0 / 2),
                Row(
                  children: const [
                    Expanded(
                      child: Skeleton(
                        height: 500,
                        width: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkeltonWrite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Skeleton(
              width: 20,
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
