double calculate(List<dynamic> inputs) {
  if (inputs.isEmpty) throw ArgumentError('Input list is empty');
  
  double result = inputs[0] is num ? inputs[0].toDouble() : double.parse(inputs[0]);
  
  for (int i = 1; i < inputs.length - 1; i += 2) {
    String operator = inputs[i];
    double operand = inputs[i + 1] is num ? inputs[i + 1].toDouble() : double.parse(inputs[i + 1]);
    
    switch (operator) {
      case '+':
        result += operand;
        break;
      case '-':
        result -= operand;
        break;
      case '*':
        result *= operand;
        break;
      case '/':
        if (operand == 0) throw ArgumentError('Division by zero');
        result /= operand;
        break;
      case '%':
        if (operand == 0) throw ArgumentError('Modulo by zero');
        result %= operand;
        break;
      default:
        throw ArgumentError('Invalid operator: $operator');
    }
  }
  
  return result;
}

void main() {
  print(calculate([5, '+', 3, '*', 2])); // 16.0
  print(calculate([10, '-', 4, '/', 2])); // 3.0
  
  try {
    print(calculate([10, '/', 0]));
  } catch (e) {
    print('Error: $e');
  }
  
  try {
    print(calculate([5, '&', 3]));
  } catch (e) {
    print('Error: $e');
  }
}