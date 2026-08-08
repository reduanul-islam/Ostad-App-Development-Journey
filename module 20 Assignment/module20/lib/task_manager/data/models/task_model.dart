class TaskModel {
  final String id;
  final String title;
  final String description;
  final String email;
  final String createdDate;
  final String status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.email,
    required this.createdDate,
    required this.status,
  });

  factory TaskModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return TaskModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      email: json['email'] ?? '',
      createdDate: json['createdDate'] ?? '',
      status: json['status'] ?? '',
    );
  }
}