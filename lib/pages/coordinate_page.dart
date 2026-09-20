import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../features/coordinate/bloc/coordinate_bloc.dart';
import '../features/coordinate/bloc/coordinate_event.dart';
import '../features/coordinate/bloc/coordinate_state.dart';

class CoordinatePage extends StatelessWidget {
  const CoordinatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final latController = TextEditingController();
    final lonController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('坐标转换')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CoordinateBloc, CoordinateState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('输入坐标 (WGS84 度分秒/十进制度数):', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: latController,
                        decoration: const InputDecoration(labelText: '纬度', border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: lonController,
                        decoration: const InputDecoration(labelText: '经度', border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: state.fromSystem,
                        decoration: const InputDecoration(labelText: '源坐标系', border: OutlineInputBorder()),
                        items: const [
                          DropdownMenuItem(value: 'wgs84', child: Text('WGS84')),
                          DropdownMenuItem(value: 'gcj02', child: Text('GCJ02 (火星)')),
                          DropdownMenuItem(value: 'cgcs2000', child: Text('CGCS2000')),
                        ],
                        onChanged: (v) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: state.toSystem,
                        decoration: const InputDecoration(labelText: '目标坐标系', border: OutlineInputBorder()),
                        items: const [
                          DropdownMenuItem(value: 'wgs84', child: Text('WGS84')),
                          DropdownMenuItem(value: 'gcj02', child: Text('GCJ02 (火星)')),
                          DropdownMenuItem(value: 'cgcs2000', child: Text('CGCS2000')),
                          DropdownMenuItem(value: 'utm', child: Text('UTM')),
                        ],
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final lat = double.tryParse(latController.text);
                      final lon = double.tryParse(lonController.text);
                      if (lat != null && lon != null) {
                        context.read<CoordinateBloc>().add(
                          CoordinateConvertRequested(LatLng(lat, lon), state.fromSystem, state.toSystem),
                        );
                      }
                    },
                    child: const Text('转换'),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('转换结果:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...state.results.entries.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(width: 100, child: Text('${e.key.toUpperCase()}:', style: const TextStyle(fontWeight: FontWeight.w600))),
                      Expanded(child: SelectableText(e.value)),
                    ],
                  ),
                )),
                if (state.error != null)
                  Text('错误: ${state.error}', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ],
            );
          },
        ),
      ),
    );
  }
}
