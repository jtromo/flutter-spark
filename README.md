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

## Flutter setup

1. Install FVM: Follow the setup steps using the [Install Script](https://fvm.app/documentation/getting-started/installation)
  1. Add the following to your flutter config:
  ```
  # FVM
  export PATH="$HOME/.fvm_flutter/bin:$PATH" // may already be added without $HOME
  # Flutter
  export PATH="$HOME/fvm/default/bin:$PATH" // Sets the global flutter to use FVM version
  export FLUTTER_FRAMEWORK_DIR="$HOME/fvm/default/bin/cache/artifacts/engine/ios"
  export DART_SDK_PATH="$HOME/fvm/default/bin"
  export FLUTTER_SDK_PATH="$HOME/fvm/default/bin"
  ```
  1. Refresh your shell: source ~/.zshrc (or your shell config file)
  1. See [Flutter Version](#flutter-version) for the current version that should be used and additional details.
1. View the current version using fvm list. The Local version is the version for the project.

1. Install the Flutter version set by the project [fvm install](https://fvm.app/documentation/guides/basic-commands#install)
```
# Install from project config
fvm install
```
1. Set the Flutter version using [fvm use](https://fvm.app/documentation/guides/basic-commands#use)
```
fvm use
```

### Changing version (local)

The current version of Flutter can be checked via fvm --version in the project directory.

To change your version, follow the steps in [Flutter Version](#flutter-version).

1. Install the new version of Flutter using [fvm install [version]](https://fvm.app/documentation/guides/basic-commands#install)
```
fvm install [version]
```

1. Set the Flutter version using [fvm use [version]](https://fvm.app/documentation/guides/basic-commands#use)
```
fvm use [version]
```

Set global version:

fvm global 3.24.3

