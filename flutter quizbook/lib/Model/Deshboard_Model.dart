// class DashboardModel {
//   final String standardName;
//   final String subjectName;
//   final String subjectImage;

//   DashboardModel({
//     required this.standardName,
//     required this.subjectName,
//     required this.subjectImage,
//   });

//   get subjects => null;
// }

class StandardModel {
  final int std;
  final List<SubjectModel> subject;

  StandardModel({required this.std, required this.subject});
}

class SubjectModel {
  final String subjectName;
  final String img;

  SubjectModel({required this.subjectName, required this.img});
}
