import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String imagePath;
  final String? title;
  final String? subtitle;
  bool completed;
  final Color completedColor;
  final Function(bool) onCheckboxChanged;

  CustomListTile({
    Key? key,
    required this.imagePath,
    required this.title,
    this.subtitle,
    this.completed = false,
    this.completedColor = Colors.grey,
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => CustomListTileState();
}

class CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: widget.completed,
      selected: false,
      leading: Opacity(
          opacity: widget.completed ? 0.6 : 1.0,
          child: Image.asset(widget.imagePath)),
      title: widget.title != null
          ? Text(
              widget.title!,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: widget.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            )
          : null,
      subtitle: widget.subtitle != null
          ? Text(
              widget.subtitle!,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                decoration: widget.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            )
          : null,
      trailing: Transform.scale(
        scale: 1.4,
        child: Checkbox(
          activeColor: const Color(0xff4A3780),
          onChanged: (bool? value) {
            widget.onCheckboxChanged(value ?? false);
          },
          value: widget.completed,
        ),
      ),
    );
  }
}
