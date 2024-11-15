import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../common/color_extension.dart';
import '../../common_widget/response_row.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map workoutData;

  const WorkoutDetailView({super.key, required this.workoutData});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  List workArr = [
    {"image": "assets/img/1.png"},
    {"image": "assets/img/2.png"},
    {
      "image": "assets/img/5.png",
    },
    {
      "image": "assets/img/3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.1,
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
          widget.workoutData['name'],
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.workoutData['image'],
              width: media.width,
              height: media.width * 0.55,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Steps",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: media.width * 0.26,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: workArr.length,
                  itemBuilder: (context, index) {
                    var wObj = workArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      width: media.width * 0.28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                wObj["image"].toString(),
                                width: media.width,
                                height: media.width * 0.15,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: media.width,
                                height: media.width * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            // Thêm phần mô tả bài tập
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                "Mô tả bài tập",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Đây là phần mô tả chi tiết về bài tập, hướng dẫn thực hiện và các lưu ý quan trọng khi tập luyện. Bạn có thể thay đổi nội dung này theo yêu cầu của mình.",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    height: 1.5),
              ),
            ),
            // Thêm nút Start
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút Start
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF77e517), // Màu theo yêu cầu
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Bo góc nút
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}