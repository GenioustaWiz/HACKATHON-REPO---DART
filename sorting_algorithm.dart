
import 'dart:math';

List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;
  
  int pivot = list[list.length ~/ 2];
  List<int> less = list.where((e) => e < pivot).toList();
  List<int> equal = list.where((e) => e == pivot).toList();
  List<int> greater = list.where((e) => e > pivot).toList();
  
  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

List<int> bubbleSort(List<int> list) {
  List<int> result = List.from(list);
  for (int i = 0; i < result.length; i++) {
    for (int j = 0; j < result.length - 1 - i; j++) {
      if (result[j] > result[j + 1]) {
        int temp = result[j];
        result[j] = result[j + 1];
        result[j + 1] = temp;
      }
    }
  }
  return result;
}

void comparePerformance(List<int> list) {
  Stopwatch stopwatch = Stopwatch()..start();
  
  quickSort(List.from(list));
  print('Quick Sort time: ${stopwatch.elapsedMicroseconds} microseconds');
  
  stopwatch.reset();
  
  bubbleSort(List.from(list));
  print('Bubble Sort time: ${stopwatch.elapsedMicroseconds} microseconds');
}

void main() {
  List<int> numbers = List.generate(1000, (_) => Random().nextInt(1000));
  
  print('Original list: $numbers');
  print('Quick Sort result: ${quickSort(numbers)}');
  print('Bubble Sort result: ${bubbleSort(numbers)}');
  
  comparePerformance(numbers);
}