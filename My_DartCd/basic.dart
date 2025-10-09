// void main() {
//   print(printName());
// }

// int printName() {
//   return 12;
// }
/* we can return many dtatype from one single calling after 
dart 3*/
// void main() {
//   var name = printname();
//   print(printname());
//   print(name.$2);
//   //$2 represent String here
// }

// (int, String) printname() {
//   return (3, 'c');
// }

//NAMED ARGUMENT AND POSITIONAL ARGUMENT.
// void main() {
//   String name = 'Adi';
//   printname(greeting: 'Hello', name: name);
// }

// here required mean this field canot be blank or left write somethigh and
//int? value given return value if not then null.
// void printname({required String name, int? age, required String greeting}) {
//   print(age);
//   print(name);
// }

//both positional and named
//positional should be before named
// void main() {
//   String name = 'Adi';
//   printname(12,false,greeting: 'Hello', name: name);
// }
// void printname(int age,bool isadult ,{required String greeting , String? name}) {
//   print(age);
//   print(name);
// }

//Different ways of funtion calling
// void main() {
//   final stuff = printstuff();
//   stuff();
//   () {
//     print('hiii');
//   }();
// }

// Function printstuff() {
//   return () {
//     print('hii');
//   };
// }
//execution defined below .
//  1.final stuff = printstuff();

// This line calls the function printstuff().

// The printstuff function doesn't print anything itself. Instead, its only job is to return another function. The function it returns is () { print('hii'); }.

// So, the variable stuff now holds a function. The type of stuff is Function.

// stuff();

// Since the stuff variable holds a function, you can execute it by adding parentheses () after its name.

// This line calls the function stored in stuff.

// The code inside that function, print('hii');, is executed. This prints "hii" to the console.

// () { print('hiii'); }();

// This is a separate and distinct concept. It's an Immediately Invoked Function Expression (IIFE).

// Part 1: () { print('hiii'); } is the definition of an anonymous function (a function with no name).

// Part 2: () at the very end immediately calls or invokes that function right after it's defined.

// This executes the code inside, print('hiii');, which prints "hiii" to the console.

//2.56.53
//OOPS
void main() {
  print('${cookie().size} cm');
  cookie().baking();
  print(cookie().isbaking);
  final check = cookie().isbaking();
  print(check);
}

class cookie {
  //varaible
  String shape = 'cirlce';
  double size = 15.2;
  //method
  void baking() {
    print("start baking");
  }

  bool isbaking() {
    return false;
  }
}
// print('${...} cm') 👉 String Interpolation and Output

// The ${} syntax inside a string is called string interpolation. It's a clean way to insert the value of an expression directly into a string.

// The program replaces the expression ${cookie().size} with its resulting value, 15.2.

// The final string becomes '15.2 cm'.

// The print() function then displays this final string on the console.
