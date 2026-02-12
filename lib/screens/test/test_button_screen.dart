import 'package:blablacar/theme/theme.dart';
import 'package:blablacar/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

class TestButtonScreen extends StatelessWidget {
  const TestButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          BlaButton(
            text: 'test all parameter', 
            onPressed: (){},
            icon: Icons.schedule_outlined,
            type: ButtonType.primary,
          ),
          SizedBox(height: BlaSpacings.m,),
          BlaButton(
            text: 'test secondary',
            onPressed: (){},
            icon: Icons.calendar_view_day_outlined,
            type: ButtonType.secondary,
          ),
          SizedBox(height: BlaSpacings.m,),
          BlaButton(
            text: 'test without icon',
            onPressed: (){},
            type: ButtonType.secondary,
          )
        ],
      ),
    );
  }
}
