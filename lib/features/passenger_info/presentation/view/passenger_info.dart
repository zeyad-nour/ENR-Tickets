import 'package:flutter/material.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({super.key});

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  String gender = "male";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/train.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(color: Colors.black.withOpacity(0.6)),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "ENR",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "PASSENGER INFORMATION",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildField("Full Name", Icons.person, nameController),
                        buildField(
                          "Phone Number",
                          Icons.phone,
                          phoneController,
                        ),
                        buildField(
                          "Email Address",
                          Icons.email,
                          emailController,
                        ),

                        const SizedBox(height: 15),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<String>(
                            value: gender,
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: const [
                              DropdownMenuItem(
                                value: "male",
                                child: Text("Male"),
                              ),
                              DropdownMenuItem(
                                value: "female",
                                child: Text("Female"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ),

                        const SizedBox(height: 25),

Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.pop(context, {
                                    "name": nameController.text,
                                    "phone": phoneController.text,
                                    "email": emailController.text,
                                    "gender": gender,
                                  });
                                },
                                child: const Text("Save"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildField(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.red),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}