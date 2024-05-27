import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbot/drawer.dart';
import 'package:medbot/main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    print("on homepage.dart");
    return Scaffold(
      drawer: const customDrawer(),
      appBar: AppBar(
        title: const Text('AI Medical Assistant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  'Hello, ${controller.name}!',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(64, 6, 192, 224),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(() {
                            return LinearProgressIndicator(
                              value: controller.user.value.weight / 100,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue.shade900),
                            );
                          }),
                          const SizedBox(height: 10),
                          Obx(() {
                            return Text(
                              '${controller.user.value.weight} kg',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Height',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return Text(
                              '${controller.user.value.height} cm',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'BMI',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(() {
                          return Text(
                            ((controller.user.value.weight) /
                                    ((controller.user.value.height) /
                                        100 *
                                        (controller.user.value.height / 100)))
                                .toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Obx(() => Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.3),
                        child: BmiProgressIndicator(
                            bmi: ((controller.user.value.weight) /
                                ((controller.user.value.height) /
                                    100 *
                                    (controller.user.value.height / 100)))),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Chat with bot'),
                    subtitle: const Text('Chat with our AI chat expert'),
                    leading: const Icon(Icons.chat_bubble),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.pushNamed(context, "/chat");
                    },
                  ),
                  ListTile(
                    title: const Text('View Medical Records'),
                    subtitle: const Text('View your medical history'),
                    leading: const Icon(Icons.folder),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Book an Appointment'),
                    subtitle: const Text('Schedule a doctor visit'),
                    leading: const Icon(Icons.event),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiProgressIndicator extends StatelessWidget {
  double bmi;
  BmiProgressIndicator({required this.bmi, super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate BMI category based on user's BMI
    String bmiCategory = "";
    if (bmi < 18.5) {
      bmiCategory = "Underweight";
    } else if (bmi > 18.5 && bmi < 25) {
      bmiCategory = "Normal";
    } else if (bmi > 25 && bmi < 30) {
      bmiCategory = "Overweight";
    } else {
      bmiCategory = "Obese";
    }

    // Define colors for each BMI category
    Color color;
    switch (bmiCategory) {
      case "Underweight":
        color = Colors.yellow;
        break;
      case "Normal":
        color = Colors.green;
        break;
      case "Overweight":
        color = Colors.orange;
        break;
      case "Obese":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Stack(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: 1.0,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: 6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 35, 0, 0),
          child: Text(
            bmiCategory,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
