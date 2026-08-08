class TMUrls {
  static const String baseUrl =
      'https://task-manager-api.ostad.live/api/v1';

  static const String registration =
      '$baseUrl/Registration';

  static const String login =
      '$baseUrl/login';

  static const String createTask =
      '$baseUrl/createTask';

  static String taskByStatus(String status) {
    return '$baseUrl/listTaskByStatus/$status';
  }

  static String updateTaskStatus(String id, String status) {
    return '$baseUrl/updateTaskStatus/$id/$status';
  }

  static String deleteTask(String id) {
    return '$baseUrl/deleteTask/$id';
  }

  static const String taskStatusCount =
      '$baseUrl/taskStatusCount';
}