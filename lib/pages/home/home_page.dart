import 'package:flutter/material.dart';
import 'package:mental_health_app/data/home_list_items_data.dart';
import 'package:mental_health_app/pages/home/widgets/emotion.item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade400,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.markunread_sharp),
            label: "messages",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "contacts"),
        ],
      ),
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
            SizedBox(height: 20),
            _BottomSheet(),
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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class _BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Column(
            children: [_TitleSheet(), SizedBox(height: 20), _List()],
          ),
        ),
      ),
    );
  }
}

class _TitleSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Excercises",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Icon(Icons.more_horiz, color: Colors.black),
      ],
    );
  }
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: listItemsData.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10),
          child: _ListItem(
            color: listItemsData[index]["color"],
            title: listItemsData[index]["title"],
            description: listItemsData[index]["description"],
            icon: listItemsData[index]['icon'],
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final IconData icon;

  const _ListItem({
    required this.color,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                description,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Icon(Icons.more_horiz, color: Colors.black),
      ],
    );
  }
}
