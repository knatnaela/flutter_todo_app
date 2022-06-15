import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/di/get_it.dart';
import 'package:flutter_todo_app/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:flutter_todo_app/presentation/views/home_screen.dart';
import 'package:flutter_todo_app/presentation/widget/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen(
      {Key? key, this.title = "", this.description = "", this.id})
      : super(key: key);
  final String? title;
  final String? description;
  final String? id;
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late AddTaskBloc addTaskBloc;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    addTaskBloc = getItInstance<AddTaskBloc>();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    addTaskBloc.close();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addTask() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTaskBloc>.value(
      value: addTaskBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Task"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: "Title",
                    controller: titleController,
                  ),
                  CustomTextField(
                    labelText: "Description",
                    keyboardType: TextInputType.multiline,
                    controller: descriptionController,
                  ),
                  BlocConsumer<AddTaskBloc, AddTaskState>(
                    buildWhen: (previous, current) => current is AddTaskError,
                    builder: (context, state) {
                      if (state is AddTaskError) {
                        return Text("error");
                      }
                      return const SizedBox.shrink();
                    },
                    listenWhen: (previous, current) => current is AddTaskLoaded,
                    listener: (context, state) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => addTaskBloc.add(
                      AddUserTaskEvent(
                        title: titleController.text,
                        description: descriptionController.text,
                        id: widget.id,
                      ),
                    ),
                    child: const Text("Add"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
