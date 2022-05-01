import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Item {
  late String title;
  late String description;
  late bool finished;
  late Icon icon;
  late Color color;

  Item(String itemTitle, String itemDescription, bool itemState,Icon itemIcon,Color itemColor) {
    title = itemTitle;
    description = itemDescription;
    finished = itemState;
    icon = itemIcon;
    color = itemColor;
  }

  Item.fromItem(Item item) {
    title = item.title;
    description = item.description;
    finished = item.finished;
    icon = item.icon;
    color = item.color;
  }

  ListTile makeItem() {
    return ListTile(
      leading: const Text("L"),
      title: Text(title),
      subtitle: Text(description),
      trailing: const Text("End"),
    );
  }
}
