import '../data/models/task_model.dart';
import '../data/service/api_service.dart';
import '../utils/urls.dart';

class TaskController {
  final ApiService apiService = ApiService();

  Future<bool> createTask(
    String title,
    String description,
    String token,
  ) async {
    final response = await apiService.postWithToken(
      TMUrls.createTask,
      {
        'title': title,
        'description': description,
      },
      token,
    );

    return response['status'] == 'success';
  }

  Future<List<TaskModel>> getTasks(
    String status,
    String token,
  ) async {
    final response = await apiService.getRequest(
      TMUrls.taskByStatus(status),
      token,
    );

    if (response['status'] == 'success') {
      final List data = response['data'];

      return data
          .map(
            (item) => TaskModel.fromJson(item),
          )
          .toList();
    }

    return [];
  }
}