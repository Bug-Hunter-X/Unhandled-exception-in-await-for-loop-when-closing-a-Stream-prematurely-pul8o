```dart
import 'dart:async';

Future<void> main() async {
  final stream = Stream.periodic(const Duration(seconds: 1), (i) => i);

  try {
    await for (final value in stream) {
      print('Value: $value');
      if (value == 5) {
        await stream.close();
        break; //Added break to exit the loop after closing the stream
      }
    }
  } catch (e) {
    print('Error: $e'); //Handle potential StateError
  }
  print('Stream processing completed');
}
```