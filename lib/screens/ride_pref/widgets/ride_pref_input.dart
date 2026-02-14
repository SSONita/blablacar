import 'package:blablacar/theme/theme.dart';
import 'package:blablacar/widgets/actions/bla_icon_button.dart';
import 'package:flutter/material.dart';

class RidePrefInput extends StatelessWidget {
  final String title;
  final IconData leftIcon;
  final IconData? rightIcon;
  final bool placeHolder;
  final VoidCallback onPressed;
  final VoidCallback? onRightIconPressed;
  const RidePrefInput({
    super.key,
    required this.title,
    required this.leftIcon,
    this.rightIcon,
    this.placeHolder = false,
    required this.onPressed,
    this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = placeHolder ? BlaColors.textLight : BlaColors.textNormal;
    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor),
      ),
      leading: Icon(leftIcon, size: 20, color: BlaColors.iconLight),
      trailing: rightIcon != null
          ? BlaIconButton(icon: rightIcon!, onPressed: onRightIconPressed)
          : null,
    );
  }
}
