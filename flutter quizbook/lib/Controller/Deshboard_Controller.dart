import 'package:get/get.dart';
import 'package:quiz_2/Model/Deshboard_Model.dart';

class DashboardController extends GetxController {
  RxList<DashboardModel> dashboardItems = <DashboardModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize your data here (replace it with your actual data)
    List<Map<String, String>> rawData = [
      {
        'standardName': 'Grade 1',
        'subjectName': 'Math',
        'subjectImage': 'math_image.jpg'
      },
      {
        'standardName': 'Grade 1',
        'subjectName': 'Science',
        'subjectImage': 'science_image.jpg'
      },
      {
        'standardName': 'Grade 1',
        'subjectName': 'Science',
        'subjectImage': 'science_image.jpg'
      },
      {
        'standardName': 'Grade 1',
        'subjectName': 'Science',
        'subjectImage': 'science_image.jpg'
      },
      {
        'standardName': 'Grade 1',
        'subjectName': 'Science',
        'subjectImage': 'science_image.jpg'
      },
      {
        'standardName': 'Grade 1',
        'subjectName': 'Science',
        'subjectImage': 'science_image.jpg'
      },
      // Add more data as needed
    ];

    // Convert raw data to DashboardModel and update the observable list
    dashboardItems.value = rawData
        .map((data) => DashboardModel(
              standardName: data['standardName']!,
              subjectName: data['subjectName']!,
              subjectImage: data['subjectImage']!,
            ))
        .toList();
  }
}
