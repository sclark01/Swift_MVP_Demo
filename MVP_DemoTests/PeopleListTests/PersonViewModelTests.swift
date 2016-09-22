import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonViewModelTests : QuickSpec {
    override func spec() {
        describe("person view model") {
            it("should return name as string and phone labeled with 'phone: ', and id as int") {
                let name = "someName"
                let phone = "somePhone"
                let age = "someAge"
                let id = 0
                let person = Person(id: id, name: name, phone: phone, age: age)
 
                let personViewModel = PersonForListViewModel(person: person)

                let expectedPhone = "Phone: \(phone)"

                expect(personViewModel.name) == name
                expect(personViewModel.phone) == expectedPhone
                expect(personViewModel.id) == id
            }
        }

        describe("equality") {
            it("should show VM as equal when two people are the same") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")

                let personVM1 = PersonForListViewModel(person: person1)
                let personVM2 = PersonForListViewModel(person: person1)

                expect(person1) == person1
                expect(personVM1) == personVM2
            }

            it("should show VM as equal when two people are not the same") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "differentName", phone: "differentPhone", age: "someAge")

                let personVM1 = PersonForListViewModel(person: person1)
                let personVM2 = PersonForListViewModel(person: person2)

                expect(person1) != person2
                expect(personVM1) != personVM2
            }
        }
    }
}