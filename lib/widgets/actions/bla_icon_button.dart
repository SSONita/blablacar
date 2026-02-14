import 'package:blablacar/theme/theme.dart';
import 'package:flutter/widgets.dart';

class BlaIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const BlaIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(icon, size: 10, color: BlaColors.primary),
      ),
    );
  }
}
