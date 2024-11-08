import 'package:flutter/material.dart';
import 'package:workout_fitness/view/workout/workout_detail_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/tab_button.dart';

class ExerciseView2 extends StatefulWidget {
  const ExerciseView2({super.key});

  @override
  State<ExerciseView2> createState() => _ExerciseView2State();
}

class _ExerciseView2State extends State<ExerciseView2> {
  int isActiveTab = 0;

  List kneeWorkouts = [
    {"name": "Straight Leg Raises", "image": "assets/img/1.png"},
    {"name": "Heel Slides", "image": "assets/img/2.png"},
    {"name": "Wall Sits", "image": "assets/img/3.png"},
  ];

  List backWorkouts = [
    {"name": "Bird Dog", "image": "assets/img/4.png"},
    {"name": "Pull-Up", "image": "assets/img/5.png"},
    {"name": "Back Bridge", "image": "assets/img/6.png"},
  ];

  List get currentWorkouts => isActiveTab == 0 ? kneeWorkouts : backWorkouts;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Exercise",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: TColor.white, boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
            ]),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TabButton2(
                    title: "Knee",
                    isActive: isActiveTab == 0,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TabButton2(
                    title: "Back",
                    isActive: isActiveTab == 1,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: ListView.builder(
                  key: ValueKey<int>(isActiveTab),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemCount: currentWorkouts.length,
                  itemBuilder: (context, index) {
                    var wObj = currentWorkouts[index] as Map? ?? {};
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WorkoutDetailView(workoutData: wObj)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  wObj["image"].toString(),
                                  width: media.width,
                                  height: media.width * 0.45,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: media.width,
                                  height: media.width * 0.45,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    wObj["name"],
                                    style: TextStyle(
                                        color: TColor.secondaryText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WorkoutDetailView(workoutData: wObj)));
                                      },
                                      icon: Image.asset("assets/img/more.png",
                                          width: 20, height: 20))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
