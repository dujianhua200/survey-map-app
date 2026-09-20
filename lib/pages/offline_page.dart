import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/offline/bloc/offline_bloc.dart';
import '../features/offline/bloc/offline_event.dart';
import '../features/offline/bloc/offline_state.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('离线地图')),
      body: BlocBuilder<OfflineBloc, OfflineState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator());
          return Column(
            children: [
              if (state.downloadStatus == OfflineDownloadStatus.downloading)
                LinearProgressIndicator(value: state.progress),
              Expanded(
                child: state.packages.isEmpty
                    ? const Center(child: Text('暂无离线包'))
                    : ListView.builder(
                        itemCount: state.packages.length,
                        itemBuilder: (context, index) {
                          final pkg = state.packages[index];
                          return ListTile(
                            title: Text(pkg.name),
                            subtitle: Text('${pkg.minZoom}-${pkg.maxZoom}级  ${(pkg.fileSize / 1024 / 1024).toStringAsFixed(1)} MB'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => context.read<OfflineBloc>().add(OfflinePackageDeleted(pkg.id)),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDownloadInfo(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDownloadInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('离线包下载'),
        content: const Text('离线下载功能需要在地图页面框选区域后触发。当前页面仅展示已下载的离线包列表。'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('知道了')),
        ],
      ),
    );
  }
}
