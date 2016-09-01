import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonTests : QuickSpec {
    override func spec() {
        describe("a person") {
            it("should be equal when they have the same name and phone number") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone")
                let person2 = Person(id: 0, name: "someName", phone: "somePhone")

                expect(person1) == person2
            }

            it("should not be equal when they have the same name but different phones") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone")
                let person2 = Person(id: 0, name: "someName", phone: "someDifferentPhone")

                expect(person1) != person2
            }

            it("should not be equal when they have the same phone but different names") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone")
                let person2 = Person(id: 0, name: "someDifferentName", phone: "somePhone")

                expect(person1) != person2
            }
        }
    }
}