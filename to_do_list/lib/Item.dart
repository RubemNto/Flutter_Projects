import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Item {
  late String title;
  late String description;
  late bool finished;
  late Icon icon;
  late Color color;

  Item(String itemTitle, String itemDescription, bool itemState, Icon itemIcon,
      Color itemColor) {
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
      tileColor: color,
      leading: icon,
      title: Text(title),
      subtitle: Text(description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 12.5),
            child: Icon(Icons.check_circle),
          ),
          Icon(Icons.delete),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
