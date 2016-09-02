import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonViewModelTests : QuickSpec {
    override func spec() {
        describe("person view model") {
            it("should return name as string and phone labeled with 'phone: '") {
                let name = "someName"
                let phone = "somePhone"
                let person = Person(id: 0, name: name, phone: phone)
 
                let personViewModel = PersonViewModel(person: person)

                let expectedPhone = "Phone: \(phone)"

                expect(personViewModel.name) == name
                expect(personViewModel.phone) == expectedPhone
            }
        }

        describe("equality") {
            it("should show VM as equal when two people are the same") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone")

                let personVM1 = PersonViewModel(person: person1)
                let personVM2 = PersonViewModel(person: person1)

                expect(person1) == person1
                expect(personVM1) == personVM2
            }

            it("should show VM as equal when two people are not the same") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone")
                let person2 = Person(id: 1, name: "differentName", phone: "differentPhone")

                let personVM1 = PersonViewModel(person: person1)
                let personVM2 = PersonViewModel(person: person2)

                expect(person1) != person2
                expect(personVM1) != personVM2
            }
        }
    }
}