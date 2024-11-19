print("Publisher")
// https://developer.apple.com/documentation/combine/publisher

import Combine


class MyPublisher: Publisher {

    var mySubscriber: MySubscriber? = nil

    // https://developer.apple.com/documentation/combine/publisher/output
    typealias Output = Int

    // https://developer.apple.com/documentation/combine/publisher/failure
    typealias Failure = Error

    // https://developer.apple.com/documentation/combine/publisher/receive(subscriber:)
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        print("\(subscriber) Subscription recieved!")
        mySubscriber = subscriber as? MySubscriber
    }

    // https://developer.apple.com/documentation/combine/publisher/subscribe(_:)-4u8kn
    // This func calls the recieve() method in its default implementation.
    // func subscribe<S>(_ subscriber: S)

    // https://developer.apple.com/documentation/combine/publisher/subscribe(_:)-3fk20
    // func subscribe<S>(_ subject: S) -> AnyCancellable

    func emitMyValue(value: Int) {
        mySubscriber?.receive(value)
    }

    func end() {
        mySubscriber?.receive(completion: .finished)
    }
}

class MySubscriber: Subscriber {

    typealias Input = Int

    typealias Failure = Error

    func receive(subscription: Subscription) {

    }

    func receive(_ input: Int) -> Subscribers.Demand {
        print("\(input) Value recieved")

        return.unlimited
    }

    func receive(completion: Subscribers.Completion<Failure>) {
        print("Recieve completed")
    }
}

let myPublisher = MyPublisher()
let mySubscriber = MySubscriber()
// https://developer.apple.com/documentation/combine/publisher/erasetoanypublisher()
// eraseToAnyPublisher() hides the publisher Type and provides the abstraction.
myPublisher.eraseToAnyPublisher().subscribe(mySubscriber)
print("Test")

myPublisher.emitMyValue(value: 10)
myPublisher.emitMyValue(value: 20)
myPublisher.end()

// Rest in the Publishers class
