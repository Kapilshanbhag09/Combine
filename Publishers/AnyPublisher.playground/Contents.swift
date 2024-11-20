import Combine
print("AnyPublisher")
// https://developer.apple.com/documentation/combine/anypublisher

class MyPublisher: Publisher {

    typealias Output = Int

    typealias Failure = Error

    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        print("\(subscriber) Subscription recieved!")
    }
}

let publisher = MyPublisher()

// https://developer.apple.com/documentation/combine/anypublisher/init(_:)
let typeErasedPublisher = AnyPublisher(publisher)

// https://developer.apple.com/documentation/combine/anypublisher/description
print(typeErasedPublisher.description)

// https://developer.apple.com/documentation/combine/anypublisher/playgrounddescription
print(typeErasedPublisher.playgroundDescription)


