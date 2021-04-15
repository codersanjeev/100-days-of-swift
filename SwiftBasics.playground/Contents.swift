class Parent {
	var name: String
	
	init(name: String) {
		self.name = name
	}
}

class Child : Parent {
	override init(name: String) {
		super.init(name: name)
		self.name = name
	}
}

func functionOne<T : Parent>(object: T) {
	print(object.name)
}

func functionTwo(object: Parent) {
	print(object.name)
}

let object = Child(name: "object name")
functionOne(object: object)
functionTwo(object: object)
