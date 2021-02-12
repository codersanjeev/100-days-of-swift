
// variables
var str = "Hello, Swift"
print(str)
str = "Goodbye"
print(str)

// Multiline strings
var multilineString = """
This goes
over multiple
lines
"""
print(multilineString)

multilineString = """
This goes \
over multiple \
lines
"""
print(multilineString)

// String interpolation
var age = 24
var message = "Your age is \(age)"
print(message)

// Constants
let score = 100
print(score)
// score = 150 <-- not allowed

// Type inference and type annotation
var messageOne = "This type is automatically inferred to String"
var messageTwo: String = "We have specified the type for this variable as String"
