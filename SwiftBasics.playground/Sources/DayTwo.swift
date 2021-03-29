// Arrays
let red = "red"
let green = "green"
let blue = "blue"

//           [0  , 1    , 2   ]
let colors = [red, green, blue]

print(colors[1])

/**
Sets:
1. Items are stored in random order.
2. All items stored are unique.
*/

let colorsSet = Set(colors)
print(colorsSet)

/**
Tuples:
1. Fixed in size
2. Type can't be changed
3. can be accessed by name or number
*/
var name = (first: "Sanjeev", second: "Sharma")
print(name)
print(name.first)
print(name.second)
print(name.0)
print(name.1)

/**
Dictionaries: stores <Key, Value> pairs
*/
var colorCodes = [
	"red"   : 1,
	"green" : 2,
	"blue"  : 3
]
print(colorCodes)

// initialising collections
var myDictionary = [String: Int]()
var myArray = [Bool]()
var mySet = Set<String>()

/**
Enumerations: way of defining groups of related values in a way to make them easier to use.
*/
enum DeviceTheme {
	case light
	case dark
}

let currentDevice = DeviceTheme.dark
print(currentDevice)

// Enum associated values
enum Activity {
	case bored
	case running(destination: String)
	case talking(topic: String)
	case singing(volume: Int)
}

let currentActivity = Activity.talking(topic: "swift")
print(currentActivity)

// Enum raw value
enum Planet: Int {
	case mercury // 0
	case venus   // 1
	case earth   // 2
	case mars    // 3
}

let planet = Planet(rawValue: 2)
print(planet)
