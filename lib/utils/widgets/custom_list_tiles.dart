import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListHeading extends StatelessWidget {
  final String title;
  const CustomListHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 21,
        ),
      )
    );
  }
}

class CustomListTiles extends StatelessWidget {
  final Function() onTap;
  final int thisIndex;
  final int currentIndex;
  final IconData? icon;
  final String? assetPath;
  final String label;
  
  const CustomListTiles({super.key, required this.onTap,required this.thisIndex, this.icon, this.assetPath, required this.label, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      selected: (thisIndex == currentIndex) ? true : false,
      selectedColor: Colors.orange,
      selectedTileColor: Colors.grey.shade800,
      visualDensity: VisualDensity.comfortable,
      textColor: Colors.grey,
      iconColor: Colors.grey,
      leading: (icon != null)
      ? Icon(icon)
      : SvgPicture.asset(
        assetPath!,
        height: 23,
        colorFilter: ColorFilter.mode((thisIndex==currentIndex) ? Colors.orange : Colors.grey, BlendMode.srcIn)
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 20),
      ),
      hoverColor: Colors.grey,
    );
  }
}