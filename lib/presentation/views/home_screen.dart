import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/di/get_it.dart';
import 'package:flutter_todo_app/presentation/bloc/delete_task/delete_task_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_todo_app/presentation/bloc/todo_list/task_list_bloc.dart';
import 'package:flutter_todo_app/presentation/views/add_task_screen.dart';
import 'package:flutter_todo_app/presentation/views/login_screen.dart';
import 'package:flutter_todo_app/presentation/widget/task_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TaskListBloc taskListBloc;
  late DeleteTaskBloc deleteTaskBloc;
  @override
  void initState() {
    super.initState();
    taskListBloc = getItInstance<TaskListBloc>();
    taskListBloc.add(TaskListLoadEvent());
    deleteTaskBloc = getItInstance<DeleteTaskBloc>();
  }

  @override
  void dispose() {
    deleteTaskBloc.close();
    taskListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskListBloc>(
          create: (context) => taskListBloc,
        ),
        BlocProvider<DeleteTaskBloc>(
          create: (context) => deleteTaskBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TODO APP"),
          actions: [
            BlocListener<LoginBloc, LoginState>(
              listenWhen: (previous, current) => current is LogOutSuccess,
              listener: (context, state) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
              child: InkWell(
                onTap: () =>
                    BlocProvider.of<LoginBloc>(context).add(LogOutEvent()),
                child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.logout)),
              ),
            ),
          ],
        ),
        body: BlocConsumer<TaskListBloc, TaskListState>(
            buildWhen: (previous, current) =>
                current is TaskListItemRemove || current is TaskListLoaded,
            builder: (context, state) {
              if (state is TaskListLoaded) {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TaskCardWidget(
                          title: state.taskList[index].title,
                          description: state.taskList[index].description,
                          id: state.taskList[index].id,
                        ),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: state.taskList.length);
              }
              return const SizedBox.shrink();
            },
            listenWhen: (previous, current) => current is TaskItemRemovedEvent,
            listener: (context, state) => state),
        // body: BlocBuilder<TaskListBloc, TaskListState>(
        //   bloc: taskListBloc,
        //   builder: (context, state) {
        //     if (state is TaskListLoaded) {
        //       return ListView.separated(
        //           shrinkWrap: true,
        //           itemBuilder: (context, index) => TaskCardWidget(
        //                 title: state.taskList[index].title,
        //                 description: state.taskList[index].description,
        //                 id: state.taskList[index].id,
        //               ),
        //           separatorBuilder: (_, __) => const Divider(),
        //           itemCount: state.taskList.length);
        //     }
        //     return const SizedBox.shrink();
        //   },
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
