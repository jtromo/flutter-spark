# flutter-spark
Interesting and fun flutter ideas to spark your imagination, brought to you by Ember Spark Software, LLC.


To use package:json_serializable in your package, add these dependencies to your pubspec.yaml.

dependencies:
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.3.3
  json_serializable: ^6.8.0
Annotate your code with classes defined in package:json_annotation.

See lib/example.dart for an example of a file using these annotations.

See lib/example.g.dart for the generated file.

Run dart run build_runner build to generate files into your source directory.

> dart run build_runner build
[INFO] ensureBuildScript: Generating build script completed, took 368ms
[INFO] BuildDefinition: Reading cached asset graph completed, took 54ms
[INFO] BuildDefinition: Checking for updates since last build completed, took 663ms
[INFO] Build: Running build completed, took 10ms
[INFO] Build: Caching finalized dependency graph completed, took 44ms
[INFO] Build: Succeeded after 4687ms with 1 outputs
