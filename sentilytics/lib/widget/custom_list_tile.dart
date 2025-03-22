import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String listTitleText;
  final VoidCallback onTap;
  final bool changeColor;
  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.listTitleText,
    required this.onTap,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      tileColor:
          changeColor
              ? Theme.of(context).primaryColor
              : Theme.of(context).hoverColor,
      leading: Icon(
        leadingIcon,
        color:
            changeColor
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).primaryColor,
      ),
      title: Text(
        listTitleText,
        style: TextStyle(
          color:
              changeColor
                  ? Theme.of(context).secondaryHeaderColor
                  : Theme.of(context).primaryColor,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color:
            changeColor
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).primaryColor,
      ),
      onTap: onTap,
    );
  }
}
