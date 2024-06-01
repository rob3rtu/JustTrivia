import 'package:flutter/material.dart';

class Item {
  final String name;
  final IconData icon;

  const Item({
    required this.name,
    required this.icon,
  });
}

class Category {
  final String category;
  final List<Item> items;

  const Category({
    required this.category,
    required this.items,
  });
}

class SettingsItems {
  SettingsItems._();

  static const List<Category> list = [
    Category(
      category: "Suport",
      items: [
        Item(name: "Raporteaza o problema", icon: Icons.bug_report),
        Item(name: "Sugereaza o noua intrebare", icon: Icons.add),
      ],
    ),
    Category(
      category: "Cont",
      items: [
        Item(name: "Sterge cont", icon: Icons.delete_forever),
      ],
    ),
  ];
}
