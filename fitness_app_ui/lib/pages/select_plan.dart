


import 'package:fitness_app_ui/components/plan_card.dart';
import 'package:flutter/material.dart';

class SelectPlan extends StatelessWidget {
  const SelectPlan({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Select Membership Plans",
                      textAlign: TextAlign.left,
                      style:  TextStyle(
                        fontSize: 22,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                      const SizedBox(height: 50,),
                      const PlanCard(title: "Basic Plan"),
                      const PlanCard(title: "Standard Plan"),
                      const PlanCard(title: "Premium Plan"),
                      
              ],
            ),
          ),
        ),
      ),
    );
  }
}