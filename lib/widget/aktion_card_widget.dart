import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AktionCardsWidget extends HookConsumerWidget {
  const AktionCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),

      //semanticContainer: true,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.5,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            const Text(
              'Very long Titel lorem ipsum lorem episiso text lorem.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 22),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '10.3. - 10.4.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Icon(
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
