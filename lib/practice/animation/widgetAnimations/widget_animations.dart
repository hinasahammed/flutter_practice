import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:text_marquee/text_marquee.dart';

class WidgetAnimations extends StatefulWidget {
  const WidgetAnimations({super.key});

  @override
  State<WidgetAnimations> createState() => _WidgetAnimationsState();
}

class _WidgetAnimationsState extends State<WidgetAnimations> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FadeInImage(
                fadeOutCurve: Curves.easeIn,
                fadeOutDuration: const Duration(milliseconds: 600),
                width: size.width,
                height: size.height * .4,
                fit: BoxFit.cover,
                placeholder: const NetworkImage(
                    "https://i.pinimg.com/564x/6a/f1/ec/6af1ec6645410a41d5339508a83b86f9.jpg"),
                image: const NetworkImage(
                    "https://i.pinimg.com/564x/49/34/81/4934811ed2a9783620bcb3aabed89648.jpg"),
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isClicked ? Colors.blueAccent : Colors.amber,
                    ),
                    height: 100,
                    duration: const Duration(milliseconds: 1000),
                  ),
                ),
                const Gap(10),
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isClicked ? Colors.cyanAccent : Colors.deepOrange,
                    ),
                    height: 100,
                    duration: const Duration(milliseconds: 1000),
                  ),
                ),
                const Gap(10),
                Expanded(
                  flex: 1,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isClicked ? Colors.brown : Colors.deepPurple,
                    ),
                    height: 100,
                    duration: const Duration(milliseconds: 1000),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedOpacity(
                  opacity: isClicked ? 1 : .2,
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    isClicked ? "Three" : "One",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: isClicked ? 0 : 1,
                  duration: const Duration(milliseconds: 600),
                  child: Text(
                    isClicked ? "changedTwo" : "Two",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                AnimatedScale(
                  duration: const Duration(milliseconds: 800),
                  scale: isClicked ? 1 : .3,
                  child: Text(
                    isClicked ? "One" : "Three",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            //Text marquee with package
            const TextMarquee(
              '"Stay close to anything that makes you glad you are alive." -Hafez',
              spaceSize: 72,
              duration: Duration(seconds: 5),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                onPressed: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: const Text("Change"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
