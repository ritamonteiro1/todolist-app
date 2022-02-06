import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../domain/use_case/add_task_use_case.dart';
import '../domain/use_case/remove_task_use_case.dart';
import '../domain/use_case/update_status_task_use_case.dart';
import '../main/my_app.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: const MyApp()),
  Provider.value(value: AddTaskUseCase()),
  Provider.value(value: RemoveTaskUseCase()),
  Provider.value(value: UpdateStatusTaskUseCase()),
];

List<SingleChildWidget> dependentServices = [];
