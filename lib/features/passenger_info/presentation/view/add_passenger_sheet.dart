import 'package:enr_tickets/features/passenger_info/presentation/view/passenger_info.dart';
import 'package:flutter/material.dart';

class AddPassengerSheet extends StatelessWidget {
  const AddPassengerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.6,
      expand: false,
      builder: (context, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  child: const PassengerScreen(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}