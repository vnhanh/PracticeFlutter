import 'package:demo_crypto_checker/core/network/api_service.dart';
import 'package:demo_crypto_checker/core/network/app_endpoints.dart';
import 'package:demo_crypto_checker/features/dashboard/models/todo_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TodoRepository {
    final ApiService _apiService;

    const TodoRepository(this._apiService);

    Future<List<TodoModel>> getListOfItems(int userId) async {
        final response = await _apiService.request(apiGetListOfTodos, DioMethod.post, param: {'user_id': userId});
        final listOfTodoResponses = response['list'] as List<dynamic>;
        return listOfTodoResponses.map((responseItem) => TodoModel.fromMap(responseItem)).toList();
    }
}
