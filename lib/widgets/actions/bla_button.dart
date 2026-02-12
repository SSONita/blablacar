import 'package:blablacar/theme/theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final ButtonType type;
  final VoidCallback onPressed;

  const BlaButton({
    super.key,
    this.icon,
    required this.text,
    this.type = ButtonType.primary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonBackgroundColor = type == ButtonType.primary
        ? BlaColors.backGroundColor
        : BlaColors.white;

    BorderSide buttonBorderColor = type == ButtonType.primary
        ? BorderSide.none
        : BorderSide(color: BlaColors.greyLight, width: 2);

    Color buttonContentColor = type == ButtonType.primary
        ? BlaColors.white
        : BlaColors.backGroundColor;

    return SizedBox(
      child: OutlinedButton(
        onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius)
          ),
          backgroundColor: buttonBackgroundColor,
          side: buttonBorderColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null)...[
              Icon(icon, color: buttonContentColor, size: 20,)
            ],
            SizedBox(width: BlaSpacings.s,),
            Text(text, style: BlaTextStyles.button.copyWith(color: buttonContentColor))
          ],
        )
      )
    );
  }
}
