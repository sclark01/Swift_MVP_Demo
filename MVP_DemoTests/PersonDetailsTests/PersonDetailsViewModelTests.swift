import Foundation
import Quick
import Nimble

@testable import MVP_Demo

class PersonDetailsViewModelTests : QuickSpec {
    override func spec() {
        describe("the person details view model") {
            it("should return name, age, and phone labeled") {
                let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let viewModel = PersonDetailsViewModel(person: person)

                let expectedName = "Name: \(person.name)"
                let expectedAge = "Age: \(person.age)"
                let expectedPhone = "Phone: \(person.phone)"

                expect(viewModel.name) == expectedName
                expect(viewModel.age) == expectedAge
                expect(viewModel.phone) == expectedPhone
            }
            describe("equality") {
                it("should be true when two VMs hold the same person") {
                    let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                    let vm1 = PersonDetailsViewModel(person: person)
                    let vm2 = PersonDetailsViewModel(person: person)

                    expect(vm1) == vm2
                }

                it("should be false when two VMs hold different people") {
                    let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                    let differentPerson = Person(id: 2, name: "differentName", phone: "differentPhone", age: "differentAge")

                    let vm1 = PersonDetailsViewModel(person: person)
                    let vm2 = PersonDetailsViewModel(person: differentPerson)

                    expect(vm1) != vm2
                }
            }
        }
    }
}