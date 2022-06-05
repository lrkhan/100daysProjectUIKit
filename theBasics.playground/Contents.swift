import UIKit

var greeting = "Hello, playground"

greeting = "Changed since var"

var myInt: Int = 3
// you can use underscores as seperators
var myLargeInt: Int = 1_000_000
var myString: String = "This is my string"
var myLoongSting: String = """
This is a multi line string
"""
var myDouble: Double = 3.14
var myBool: Bool = false

// this is a const
let life = Int.max

let myArr = [1,1,2,3,4,5]
let mySet = Set(myArr)
let myTouple = (name: "tim", age: 50)
myTouple.name
myTouple.1

let heights: [String: Double] = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Ed Sheeran"]
heights["Tom", default: 4]

// enums

enum Results {
    case success, failure
}
Results.failure

// enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
Activity.running(destination: "The store")

// by default it should be one but if you set the 0th to a specific number then it counts up from there
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

var status: Results = .failure
print(status == Results.success ? "Yay" : "Boo")

// a repeat loop will run atlest once
repeat {
    print("This is false")
} while false


outerLoop: for i in 1...10 {
    innerLoop: for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 10 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// throw functions
// define the error enum
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("thats a good password")
} catch {
    print("that password was too obvious")
}

// inout parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
print(myNum)

// clousers
let driving = {
    print("I'm driving in my car")
}

driving()

let drivingPlus = { (to: String) in
    print("I'm driving in my car \(to)")
}

drivingPlus(myString)

let drivingExtra = { (to: String) -> String in
    return "I'm driving in my car \(to)"
}

drivingExtra("boop")
print("")
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

// trailing clousure
travel {
    print("I sleep")
}

// returning clousures
func travel1() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

print("")

// both are the same
let voage = travel1()
voage("London")

let voage2: Void = travel1()("London")

// capturing values

func travel2() -> (String) -> Void {
    var counter = 1
    return {
        print("I'm going to \($0), count: \(counter)")
        counter += 1
    }
}

var lon = travel2()
lon("London")
lon("London")
lon("London")


// Structs

// computed vals

struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

var tennis = Sport(name: "Tennis", isOlympicSport: true)

tennis.olympicStatus

// property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var per1 = Person(name: "Tod")
per1.makeAnonymous()
// mutating will only work on var properties
//let per2 = Person(name: "Ed")
//per2.makeAnonymous()


// Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct PersonN {
    var name: String
    // adding lazy will only be present if accessed once
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = PersonN(name: "Ed")
ed.familyTree

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

print(Student.classSize)

// differances between class and structs
// 1. Classes dont have memberwise inits
// 2. Class has Inheratince or subclass
//      - Overriding Methods
//      - Final Class to disallow overiding
// 3. copying Structs is by value while Classes are by reference
// 4. Classes can have DeInits
// 5. Mutability

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip")
    }
}

class Person2 {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more")
    }
}

for _ in 1...3 {
    let person = Person2()
    person.printGreeting()
}
