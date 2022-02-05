// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$isTypedTaskDescriptionValidAtom =
      Atom(name: '_HomeStore.isTypedTaskDescriptionValid');

  @override
  bool get isTypedTaskDescriptionValid {
    _$isTypedTaskDescriptionValidAtom.reportRead();
    return super.isTypedTaskDescriptionValid;
  }

  @override
  set isTypedTaskDescriptionValid(bool value) {
    _$isTypedTaskDescriptionValidAtom
        .reportWrite(value, super.isTypedTaskDescriptionValid, () {
      super.isTypedTaskDescriptionValid = value;
    });
  }

  final _$taskListAtom = Atom(name: '_HomeStore.taskList');

  @override
  ObservableList<Task> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<Task> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setTypedTaskDescription(String? typedValue) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setTypedTaskDescription');
    try {
      return super.setTypedTaskDescription(typedValue);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(String typedTask) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addTask');
    try {
      return super.addTask(typedTask);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(int index) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTask(int index, bool? isCompletedTask) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.updateTask');
    try {
      return super.updateTask(index, isCompletedTask);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTypedTaskDescriptionValid: ${isTypedTaskDescriptionValid},
taskList: ${taskList}
    ''';
  }
}
