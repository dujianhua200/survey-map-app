import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/settings/bloc/settings_bloc.dart';
import '../features/settings/bloc/settings_event.dart';
import '../features/settings/bloc/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            children: [
              SwitchListTile(
                title: const Text('深色模式'),
                value: state.isDarkTheme,
                onChanged: (v) => context.read<SettingsBloc>().add(ThemeChanged(v)),
              ),
              const Divider(),
              ListTile(
                title: const Text('天地图 Key'),
                subtitle: Text(state.tiandituKey == null || state.tiandituKey!.isEmpty ? '未配置' : '已配置'),
                trailing: const Icon(Icons.edit),
                onTap: () => _showKeyDialog(context, '天地图 Key', state.tiandituKey ?? '', (v) {
                  context.read<SettingsBloc>().add(TiandituKeyUpdated(v));
                }),
              ),
              ListTile(
                title: const Text('Mapbox Token'),
                subtitle: Text(state.mapboxToken == null || state.mapboxToken!.isEmpty ? '未配置' : '已配置'),
                trailing: const Icon(Icons.edit),
                onTap: () => _showKeyDialog(context, 'Mapbox Token', state.mapboxToken ?? '', (v) {
                  context.read<SettingsBloc>().add(MapboxTokenUpdated(v));
                }),
              ),
              const Divider(),
              ListTile(
                title: const Text('关于'),
                subtitle: const Text('SurveyMap v1.0.0\n三端测绘地图应用'),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '说明：天地图 Key 需前往 https://www.tianditu.gov.cn/ 申请；Mapbox Token 需前往 https://account.mapbox.com/ 申请。申请后将 Key 填入上方配置即可使用对应图源。',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showKeyDialog(BuildContext context, String title, String currentValue, void Function(String) onSave) {
    final controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '输入 Key / Token'),
          obscureText: title.contains('Token') || title.contains('Key'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('取消')),
          TextButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(ctx);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
