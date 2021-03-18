
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;

// FFI signature of the hello_world C function
typedef hello_world_func = ffi.Void Function();
// Dart type definition for calling the C foreign function
typedef HelloWorld = void Function();

// ignore: always_declare_return_types
main() {
  var libraryPath = path.join(Directory.current.path, '..', 'bin', 'lib', 'libflutter.so');

  if (Platform.isMacOS) {
    libraryPath = path.join(Directory.current.path, '..', 'bin', 'lib', 'libflutter.dylib');
  } else if (Platform.isWindows) {
    libraryPath = path.join(
        Directory.current.path, '..', 'Debug', 'libflutter.dll');
  }

  final dylib = ffi.DynamicLibrary.open(libraryPath);
  final HelloWorld hello = dylib.lookup<ffi.NativeFunction<hello_world_func>>('hello').asFunction();

  hello();
}