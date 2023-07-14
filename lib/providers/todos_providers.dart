import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../config/helpers/random_generator.dart';
import '../domain/entities/todo.dart';

const uuid = Uuid();

enum TodoFilter { all, completed, pending }

final todoFilterProvider = StateProvider<TodoFilter>((ref) {
  return TodoFilter.all;
});

final todosProvider = StateProvider<List<Todo>>((ref) {
  return [
    Todo(
        completedAt: null,
        description: RandomGenerator.getRandomName(),
        id: uuid.v4()),
    Todo(
        completedAt: DateTime.now(),
        description: RandomGenerator.getRandomName(),
        id: uuid.v4()),
    Todo(
        completedAt: null,
        description: RandomGenerator.getRandomName(),
        id: uuid.v4()),
    Todo(
        completedAt: DateTime.now(),
        description: RandomGenerator.getRandomName(),
        id: uuid.v4()),
    Todo(
        completedAt: null,
        description: RandomGenerator.getRandomName(),
        id: uuid.v4()),
  ];
});

final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final selectedFilter = ref.watch(todoFilterProvider);
  final todos = ref.watch(todosProvider);

  switch (selectedFilter) {
    case TodoFilter.all:
      return todos;
    case TodoFilter.completed:
      return todos.where((element) => element.done).toList();
    case TodoFilter.pending:
      return todos.where((element) => !element.done).toList();
  }
});
