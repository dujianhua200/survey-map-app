import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/folder/bloc/folder_bloc.dart';
import '../features/folder/bloc/folder_event.dart';
import '../features/folder/bloc/folder_state.dart';

class FolderPage extends StatelessWidget {
  const FolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('文件夹管理')),
      body: BlocBuilder<FolderBloc, FolderState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator());
          if (state.folders.isEmpty) {
            return const Center(child: Text('暂无文件夹，点击右下角添加'));
          }
          return ListView.builder(
            itemCount: state.folders.length,
            itemBuilder: (context, index) {
              final f = state.folders[index];
              return ListTile(
                leading: Icon(f.isVisible ? Icons.folder_open : Icons.folder),
                title: Text(f.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(f.isVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => context.read<FolderBloc>().add(FolderVisibilityToggled(f.id, !f.isVisible)),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'rename') _showRenameDialog(context, f.id, f.name);
                        if (value == 'delete') context.read<FolderBloc>().add(FolderDeleted(f.id));
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'rename', child: Text('重命名')),
                        const PopupMenuItem(value: 'delete', child: Text('删除')),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建文件夹'),
        content: TextField(controller: controller, decoration: const InputDecoration(hintText: '文件夹名称')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('取消')),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                context.read<FolderBloc>().add(FolderCreated(controller.text));
              }
              Navigator.pop(ctx);
            },
            child: const Text('创建'),
          ),
        ],
      ),
    );
  }

  void _showRenameDialog(BuildContext context, String id, String currentName) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('重命名'),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('取消')),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                context.read<FolderBloc>().add(FolderRenamed(id, controller.text));
              }
              Navigator.pop(ctx);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
