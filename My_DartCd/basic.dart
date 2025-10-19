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
// void main() {
//   print('${cookie().size} cm');
//   cookie().baking();
//   print(cookie().isbaking);
//   final check = cookie().isbaking();
//   print(check);
//   //check = true; error bescauseb once alloted nothing can be changed
//   final Cookie = cookie();
//   print(Cookie.shape);
//   Cookie.shape = 'Rectangle';//we didn't change Cookie because it is final we changed
//   //we changed .shape

// print('${...} cm') 👉 String Interpolation and Output

// The ${} syntax inside a string is called string interpolation. It's a clean way to insert the value of an expression directly into a string.

// The program replaces the expression ${cookie().size} with its resulting value, 15.2.

// The final string becomes '15.2 cm'.

// The print() function then displays this final string on the console.
//   print(Cookie.shape);
// }
//3:07:3
// void main() {
//   // print(cookie().shape);
//   // cookie().shape = 'rectangle';
//   // print(cookie().shape);
//   //both time circle because in ifrst line one object was made let obj1
//   //then in second again a new object was created but third line it was pointing
//   //to first object so two times.
//   //final Cookie = cookie('hello', 10);
//   final Cookie = cookie();
//   print(Cookie._height);
//   Cookie.setheight = 15;
//   print(Cookie.height);
// }

// class cookie {
//   //varaible
//   String shape = 'cirlce';
//   double size = 15.2;
//   //3:22:00 constructor
//   //parameterized constructor
//   // cookie(this.shape, this.size) {
//   //   baking();
//   // }
//   //named consturctor
//   // cookie.named(required this.shape,required this.shape){
//   //   baking();???????????

//   //method
//   // void baking() {
//   //   print("start baking");
//   // }

//   // bool isbaking() {
//   //   return false;
//   // }
//   //private variable this can be accessed for file not for class like other
//   //language 3:26:00
//   int _height = 10;
//   //getter and setter is used to return a value
//   int get height => _height;
//   //Setters
//   set setheight(int h) {
//     _height = h;
//   }

// 3:34:00;use of static
//here you can see that construtor was not called by default and we can use data member direclty without creating an object this is where static is used
// void main() {
//   print(constant.a);
// }

// class constant {
//   constant() {
//     print('hii am Aditya');
//   }
//   static int a = 10;
//   //static method
//   static int value() {
//     return 10;
//   }
// }
//

//Inheritance
//object oriented programming
// 1️⃣ vehicle Car = car();

// You’re creating an object of type car,
// but storing it in a variable of type vehicle.
// 	•	Declared type (static type): vehicle
// 	•	Runtime type: car

// So at compile time, Dart only knows Car is a vehicle,
// not that it’s a car.

// ⸻

// 2️⃣ print(Car.wheel); ❌

// This gives an error because:
// 	•	The class vehicle doesn’t have a property called wheel.
// 	•	And since Car is declared as type vehicle, the Dart compiler refuses this — even though at runtime it would be a car.

// Dart is statically typed, so it checks members based on the declared type at compile time, not the runtime type.

// Hence:

// ❌ The getter 'wheel' isn't defined for the class 'vehicle'.

// ⸻

// 3️⃣ print((Car as car).wheel); ✅

// Here you are explicitly type casting Car to car.
// 	•	(Car as car) tells Dart:
// “Hey compiler, treat this object as a car, not just as a vehicle.”

// Now Dart knows the object has a property wheel, because it’s a car.

// Hence this line compiles and runs successfully.
// void main() {
//   vehicle Car = car();
//   print(Car.speed);
//   //print(Car.wheel);
//   print((Car as car).wheel);
//   print((Car as truck).wheel);//type 'car' is not a subtype of type 'truck' in type cast
// }

// class vehicle {
//   int speed = 10;
//   bool isMucicOn = false;
//   void accelarate() {
//     speed += 10;
//   }
// }

// class car extends vehicle {
//   int wheel = 4;
// }

// class truck {
//   int wheel = 6;
// }

// // Override.
// //dart automitaclly take inherited class not superclass but we use "@override"to use superclass method we use keyword "super"
// void main() {
//   vehicle Car = car();
//   Car.accelerate();
//   print(Car.speed);
// }

// class SomeClass {
//   int speed = 15;
//   //@override
//   void accelerate() {
//     speed += 15;
//   }
// }

// class vehicle extends SomeClass {
//   bool isMucicOn = false;
//   @override//this will override above now it only required name should be same not return type.
//   void accelerate() {
//     speed += 100;
//   }
// }

// class car extends vehicle {
//   int wheel = 4;
// }

// class truck {
//   int wheel = 6;
// }

//Implement
//chatgpt learning
// class A {
//   void sayHello() {
//     print("Hello from A");
//   }
// }

// class B {
//   void greet(); // abstract (no implementation)
// }

// class C extends A implements B {
//   @override
//   void greet() {
//     print("Hi from C");
//   }
// }

// void main() {
//   C c = C();
//   c.sayHello(); // Inherited from A
//   c.greet();    // Implemented from B
// }
// What’s happening:
// 	•	extends A → C gets all code from A.
// So it can directly call sayHello().
// 	•	implements B → C must define greet(),
// because B is treated like an interface (no real implementation).

// ⸻
//Abstract class
//my analysis before when we define normal class in case of of extned we does not required to define every method or member it's optional but in abstract it's MUST BE required with @override
//

// void main() {
//   //   OOPS
//   //   1.Polymorphism:- it alows objects of different classe sto be treated as object of common superclass.
//     cat Cat = cat();
//     Cat.sound();
//     dog Dog = dog();
//     Dog.sound();
//   //2.Abstarction:-
//   Animal anim = cat();
//   Cat.sound();
//   Animal anim2 = dog();
//   Dog.sound();

//   //3. Inheritance previous done
//   //4.Encapsilation:-bunddling of data or method together as single unit it provide data protection and work on scurrity princpple /.capsule
// }
// // //for polmorphism:-
// // class Animal {
// //   void sound() {
// //     print('Animal sound');
// //   }
// // }

// // class cat extends Animal {
// //   void sound() {
// //     print('cat making sound');
// //   }
// // }

// // class dog extends Animal {
// //   void sound() {
// //     print('dog sound');
// //   }
// // }

//for Abstarction
// void main() {
//   Animal Cat = cat();
//   Cat.sound();
//   Animal Dog = dog();
//   Dog.sound();
// }

// abstract class Animal {
//   void sound();
// }

// class cat extends Animal {
//   void sound() {
//     print('cat making sound');
//   }
// }

// class dog extends Animal {
//   void sound() {
//     print('dog sound');
//   }
// }

// mixin and obejct
// object is superclass for sting,char , int and other type if something is not defined in class and is working then it by default belong to "SUPERCLASS OBJECT";
void main() {
  //mixin
  // mixes in
  final anim = Animal();
  anim.fn();
}

mixin Jump {
  int jumping = 10;
}
mixin Scream {
  bool isScreaming = false;
}

class Animal with Jump, Scream {
  void fn() {
    print(jumping);
    print(isScreaming);
  }
}

//Class Modifier 4:33:00
