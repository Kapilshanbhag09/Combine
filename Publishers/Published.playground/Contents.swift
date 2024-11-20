import Combine
print("Published")
// https://developer.apple.com/documentation/combine/published

class MyClass {
    @Published var name: String = "Kapil"
}

let myClass = MyClass()

myClass.$name.sink(receiveValue: {
    print($0)
})
myClass.name = "Shanbhag"

// https://developer.apple.com/documentation/combine/published/projectedvalue
// https://developer.apple.com/documentation/combine/published/publisher
print(myClass.$name)
// Can again add the operaor & implementation on the Publisher of published property.
