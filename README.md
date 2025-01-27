# Unhandled exception in await for loop when closing a Stream prematurely

This repository demonstrates a common error in Dart when working with streams and the `await for` loop.  The bug arises from closing the stream prematurely within the loop, leading to an unhandled exception.

The `bug.dart` file contains the code demonstrating this issue. The `bugSolution.dart` file provides a corrected version.

## Bug

The core problem lies in closing the `Stream` within the `await for` loop. Because `await for` implicitly handles potential exceptions during stream iteration, closing the stream before the loop's normal termination triggers an error.

## Solution

The solution involves handling the potential `StateError` that occurs when trying to close a stream that has already been closed or is in a closed state.  This is accomplished by using a `try-catch` block.