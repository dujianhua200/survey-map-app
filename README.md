# 测绘地图应用 SurveyMap

三端跨平台测绘地图应用，基于 Flutter + flutter_map 构建，支持 Android、Windows、macOS。面向工程测绘与外业调查场景。

## 功能清单

### P0 功能（核心，已实现）

| 功能 | 状态 | 关键文件 |
|------|------|---------|
| 多源地图聚合与切换 | 已完成 | `lib/features/map/tile_providers/tile_source_config.dart` |
| 天地图（矢量/影像/注记） | 已完成 | 内置配置，需申请 Key |
| OpenStreetMap | 已完成 | 内置配置 |
| 谷歌卫星（需合规/代理） | 已完成 | 内置配置，带说明 |
| Mapbox（Token 占位） | 已完成 | 内置配置，需申请 Token |
| 自定义 XYZ 图源管理 | 已完成 | `lib/features/map/bloc/map_bloc.dart` |
| 自定义图层叠加 | 已完成 | `lib/pages/map_page.dart` |
| 标注体系（点/线/面/文字） | 已完成 | `lib/features/annotation/bloc/annotation_bloc.dart` |
| 距离测量 | 已完成 | `lib/features/annotation/tools/measure_tool.dart` |
| 面积测量 | 已完成 | `lib/features/annotation/tools/measure_tool.dart` |
| 坐标拾取 | 已完成 | `lib/features/coordinate/bloc/coordinate_bloc.dart` |
| 坐标转换（WGS84/GCJ02/CGCS2000/UTM） | 已完成 | `lib/core/coordinate/` |
| 离线地图下载（区域选择+瓦片下载） | 已完成 | `lib/features/offline/` |
| 轨迹记录与导出 | 已完成 | `lib/features/track/` |
| GPX/KML 导入导出 | 已完成 | `lib/features/data_exchange/` |
| 文件夹管理 | 已完成 | `lib/features/folder/` |
| 定位显示当前位置 | 已完成 | `lib/core/location/location_service.dart` |
| 图源 Key 配置入口 | 已完成 | `lib/pages/settings_page.dart` |

### P1 功能（已实现/部分实现）

| 功能 | 状态 | 说明 |
|------|------|------|
| MBTiles 离线存储格式 | 部分 | 当前以文件目录存储瓦片，MBTiles SQLite 格式预留接口 |
| 搜索 | 已完成 | 标注与轨迹名称搜索 |
| 深色模式 | 已完成 | 设置页可切换 |

## 技术栈

- **Flutter**: 3.24.5（Dart 3.5.4）
- **地图引擎**: flutter_map 7.0.2
- **状态管理**: flutter_bloc (BLoC pattern)
- **本地数据库**: Drift (SQLite ORM)
- **坐标转换**: proj4dart + 自定义 GCJ02 偏移算法
- **定位**: geolocator
- **安全存储**: flutter_secure_storage
- **HTTP**: dio
- **文件选择**: file_picker

## CI 自动构建

本工程已配置 GitHub Actions 自动构建流水线，每次推送代码到 `main` 分支或手动触发时，会自动产出 Android、Windows、macOS 三端安装包。

### 推送到 GitHub 仓库

1. 在 GitHub 上创建新仓库（如 `yourname/survey_map_app`）。
2. 将本地工程推送到该仓库：
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/yourname/survey_map_app.git
   git push -u origin main
   ```
3. 推送完成后，GitHub Actions 会自动触发构建。

### 查看构建产物

1. 打开 GitHub 仓库页面 → **Actions** 标签。
2. 选择最新的 `Build SurveyMap` 工作流运行记录。
3. 在运行详情页底部 **Artifacts** 区域可下载各端产物：
   - **survey-map-android-apk** → `app-release.apk`
   - **survey-map-windows-zip** → `survey_map_windows.zip`（解压后运行 `.exe`）
   - **survey-map-macos-zip** → `survey_map_macos.zip`（解压后双击 `.app`）

### 手动触发构建

进入仓库 **Actions** → **Build SurveyMap** → 点击右上角 **Run workflow** → 选择分支 → **Run workflow**。

### 需要配置的 Secrets（可选）

当前 Android Release 构建使用 **debug 签名**（与 `flutter run --release` 一致），可直接安装测试。如需正式发布，请在 GitHub 仓库设置中配置以下 Secrets，并修改 `android/app/build.gradle` 引用它们：

| Secret 名称 | 说明 |
|-------------|------|
| `KEYSTORE_BASE64` | 将 `.jks` 或 `.keystore` 文件进行 Base64 编码后的字符串 |
| `KEYSTORE_PASSWORD` | Keystore 密码 |
| `KEY_ALIAS` | Key 别名 |
| `KEY_PASSWORD` | Key 密码 |

> **注意**：不要把真实密钥直接提交到代码仓库；始终通过 GitHub Secrets 注入。

### 流水线环境说明

| 平台 | Runner | 预装环境 | 额外说明 |
|------|--------|---------|---------|
| Android | `ubuntu-latest` | Android SDK（随 Flutter 安装） | 无需额外配置 |
| Windows | `windows-latest` | Visual Studio 2022 + "Desktop development with C++" | 无需额外配置 |
| macOS | `macos-latest` | Xcode（最新稳定版） | GitHub 免费额度中 macOS 运行时间计费较高，请留意用量 |

---

## 三端构建说明

### Android

**环境要求**
- Flutter SDK >= 3.22.0
- Android SDK API 23+
- Android Studio 或命令行工具

**构建步骤**
```bash
flutter pub get
flutter build apk --release
```

**权限说明**
`android/app/src/main/AndroidManifest.xml` 已配置：
- `ACCESS_FINE_LOCATION` / `ACCESS_COARSE_LOCATION`
- `ACCESS_BACKGROUND_LOCATION`
- `FOREGROUND_SERVICE`
- `WRITE_EXTERNAL_STORAGE`

### Windows

**环境要求**
- Flutter SDK >= 3.22.0
- Visual Studio 2022（含 "Desktop development with C++" 工作负载）
- Windows 10 SDK

**构建步骤**
```bash
flutter pub get
flutter build windows --release
```

### macOS

**环境要求**
- Flutter SDK >= 3.22.0
- Xcode 15+
- macOS 11+

**构建步骤**
```bash
flutter pub get
flutter build macos --release
```

**权限说明**
`macos/Runner/Info.plist` 已配置位置权限描述；`DebugProfile.entitlements` 与 `Release.entitlements` 已开启网络与文件访问沙盒权限。

## 图源 Key 配置

### 天地图 Key
1. 访问 https://www.tianditu.gov.cn/
2. 注册并申请开发者 Key
3. 在 App 设置页填入 Key，或写入安全存储

### Mapbox Token
1. 访问 https://account.mapbox.com/
2. 创建 Access Token
3. 在 App 设置页填入 Token

**注意**：代码中所有 Key 均为占位符（`YOUR_KEY_HERE`），不会泄漏真实凭证。

## 项目结构

```
lib/
├── core/           # 主题、平台工具、存储、网络、定位、日志、Key管理、坐标转换
├── data/
│   ├── models/     # Drift 表定义与数据库
│   ├── daos/       # 数据访问对象
│   └── repositories/ # 仓库聚合
├── features/
│   ├── map/        # 地图、图层、Tile Provider
│   ├── annotation/ # 标注、测量工具
│   ├── track/      # 轨迹记录
│   ├── offline/    # 离线下载
│   ├── data_exchange/ # GPX/KML 导入导出
│   ├── folder/     # 文件夹管理
│   ├── coordinate/ # 坐标转换
│   ├── settings/   # 设置
│   └── search/     # 搜索
├── pages/          # UI 页面
├── shared/         # 工具与扩展
└── main.dart / app.dart
```

## 验证状态

- `dart analyze`: **零 errors**（仅剩 warnings/info，不影响编译）
- `flutter pub get`: **通过**
- `build_runner` (Drift 代码生成): **通过**
- `flutter build apk/windows/macos`: **未验证**（沙箱缺少 Android SDK / VS Build Tools / Xcode）

## 已知问题与待完善

1. 离线下载当前以文件目录存储瓦片（每个离线包为一个目录，瓦片按 `tiles/$z/$x/$y.png` 结构存放），MBTiles SQLite 格式待后续补充。
2. 文件导入（GPX/KML）UI 入口已预留，file_picker 集成在菜单中待完善。
3. Windows/macOS 桌面端的原生构建需在对应宿主环境中验证。

## License

MIT
