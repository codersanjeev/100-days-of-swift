/**
 * Swift Programming Language
 */

let x = 8	// Constant Int
// x = 9	// Doesn't compile because constant value cannot be changed

var y = 8	// Variable Int
y = 9
// y = "hello"	// Doesn't compile because string cannot be assigned to int type

var a = 9, b = 8.0, c = "Hello"

var aa: Int	// Type Annotation

let bb = 7	// Type Annotation not needed as it will be initialised anyway

// Semicolons in Swift
a = 9; b = 0.9

// Data Types
let i: Int = 9	// 32 bit or 64 bit
let ui: UInt = 7	// 32 bit or 64 bit

var bl: Bool = true

let dd: Double = 8.9	// always 64 bit
let ff: Float = 7.9	// always 32 bit

var str: String = "Hello"

// Integer Literals
let decimal = 17
let octal = 0o17
var hex = 0x17
let bin = 0b101111000

// Floating Point Literals
var fl = 1.2
fl = 12e3	// 12 * 10 ^ 3 = 12000.0
fl = 12e-3	// 12 * 10 ^ -3 = 0.012
fl = 0x12p3	// 0x12 * 2 ^ 3 = 0x12 * 8

hex = 0x1234_abcd // same as 0x1234abcd
fl = 0.2345_789	// same as 0.2345789

// let sum = hex + fl	// <-- does not compile
let sum = hex + Int(fl)	// works

// Tuples: Important Datatype
var person = ("name", 19)	// Tuple of (String, Int)
let (name, age) = person
// let (name, _) = person	// Ignore age, use _
name // or person.0
age  // or person.1

let scores = (maths: 100, physics: 222, chemistry: 435)
scores.maths

// Optional
var xx: Int? // initial value assigned is `nil`
xx = 8
// nil is not a pointer, it is an empty box
// To take to data out of box
xx!

// Uses of Optional
str = "98"
let intStr = Int(str)
if intStr != nil {
	// do something
}
// or an alternative way swift provides
// Optional Binding
if let num = intStr {
	num
	// do something with num
}

// Implicitly Unwrapped Optionals
var implString: String! = "Hello"
// 1. implString is an optional
// 2. implString is assumed to have a value (not nil)
// 3. implString can be used as an unwrapped value
/// Similar to lateinit in kotlin
implString == implString!

// Basic Operators in Swift
// +, -, *, /, %, <, >, <=, >=, ==, !=, &&, ||, !, ^, etc.
b = x > 0 ? 1.0 : 2.0	// Ternary operator
var somethingOptional: String? = "Something"
let n1 = somethingOptional != nil ? somethingOptional! : "Default"
// OR Swift provides a shorthand for the above
let n2 = somethingOptional ?? "Default"	// nil Coalescing Operator

// String and Characters in Swift
let emptyString = String()
let emptyString2 = ""	// Same as emptyString
emptyString.isEmpty	// True

// String is Value Type

let ch: Character = "."	// Character Type
let ch2 = "."	// String type, not Character type

/// String is unicode compliant
// 1. String can use any character from any language
// 2. Under the hood, each character is represented with a unique 21 bit number or a unicode scaler.
// Examples:
"\u{24}"
"\u{1F496}"

"\u{41}"	// Latin Letter A
"\u{410}"	// Russian Letter A
/// Important: They are not same.

// A Character can be represented by two different Unicode Scalers
"\u{65}\u{301}"
"\u{E9}"
/// Above two unicode scaler represent same character

let alphabets = "abcde"
for scaler in alphabets.unicodeScalars {
	print(scaler.value) // prints asciiValues
}

/// Collection Types
// 1. Array: Ordered List
// 2. All Items must be of same type
// 3. Must be Type Annotated or initialised
var arr = [1, 2, 3]
for ele in arr { print(ele) }
for (index, ele) in arr.enumerated() {
	print(index)
	print(ele)
}

// Dictionary: Key Value Pairs
var d = ["A": 1, "B": 2]
// we can add/remove elements from Dictionary but we cannot add/remove items from Tuple


/// Control Flow in Swift
// For Loops
for i in 0 ... 5 {
	print(i)
}

// While Loop
var idx = 0
while idx < 5 { idx += 1 }

// Do - While Loop / repeat while
repeat {
	idx -= 1
} while idx > 0

// Functions
func getName() -> (first: String, last: String) {
	return ("Sanjeev", "Sharma")
}

print(getName().first)
print(getName().1)

// Closures: Function without name / Unnamed Function
func lessThan(a: Int, b: Int) -> Bool {
	return a < b
}

var c1 = lessThan
c1(2, 3)
var c2 = { (a: Int, b: Int) -> Bool in
	return a < b
}
c2(2, 3)

// Capture by Value and Capture by Reference
var someValue = 200
/// This is capture by reference
var closure = { print(someValue) }
closure()
someValue = 400
closure()

/// This is capture by value
var closureTwo = { [someValue] in
	print(someValue)
}
closureTwo()
someValue = 200
closureTwo()

/// Class Initialization
// init
// deinit
// convenience init

/// ARC and Memory Leak

class ViewController {
	var viewModel: ViewModel?
}

class ViewModel {
	var viewController: ViewController?
}

func doSomething() {
	let vc = ViewController()
	let vm = ViewModel()
	vc.viewModel = vm
	vm.viewController = vc
	// at the end of this function, both vc and vm will remain in memory due
	// to reference cycle.
}


/// How to prevent reference cycle.
// make the reference weak or unowned, this way ARC will not count these references
// while destroying objects
