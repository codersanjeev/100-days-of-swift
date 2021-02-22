// Arrays
let one = "one"
let two = "two"
let three = "three"

let numbers = [one, two, three]
print(numbers)
print(numbers[1])

// Sets: unique elements in random order
let colors = Set(["red", "green", "blue", "red", "blue"])
print(colors)

// Tuples: 

class DemoInt {
	var val: Int = 0
	
	init(_ val: Int) {
		self.val = val
	}
	
}
var data: [[DemoInt]] = []

data.append([DemoInt(1), DemoInt(2), DemoInt(3)])
data.append([DemoInt(4), DemoInt(5), DemoInt(6)])

func getData() -> [DemoInt] {
	return data[0]
}

func modifyData() {
	var tempData = getData()
	tempData[1].val = 100
}

func printData() {
	data.forEach { $0.forEach { print($0.val) } }
}
	
printData()
modifyData()
printData()
