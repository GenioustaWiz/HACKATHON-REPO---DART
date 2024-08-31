bool isPalindrome(dynamic input) {
  // Convert input to string and remove non-alphanumeric characters
  String str = input.toString().toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
  
  // Check if the string is equal to its reverse
  return str == str.split('').reversed.join('');
}

void main() {
  print(isPalindrome("A man, a plan, a canal: Panama")); // true
  print(isPalindrome("Run after it")); // false
  print(isPalindrome(11611)); // true
  print(isPalindrome(90067)); // false
}