import 'package:flutter/material.dart';
import 'package:mental_health_app/pages/home/widgets/emotion.item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _Header(),
                  SizedBox(height: 25),
                  _SearchBar(),
                  SizedBox(height: 25),
                  _EmotionsPanel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Max", style: Theme.of(context).textTheme.headlineSmall),
            Text("23 Jan, 2025", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        IconButton(
          padding: EdgeInsets.all(10),

          onPressed: () {},
          icon: Icon(Icons.notifications),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Text(
            "search",
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _EmotionsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "How do you feel?",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.more_horiz),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EmotionItem(emoji: "😔", label: "Badly"),
            EmotionItem(emoji: "😊", label: "Fine"),
            EmotionItem(emoji: "😁", label: "Well"),
            EmotionItem(emoji: "😃", label: "Excellent"),
          ],
        ),
      ],
    );
  }
}
