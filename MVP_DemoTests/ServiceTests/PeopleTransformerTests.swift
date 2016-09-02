import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import MVP_Demo

class PeopleTransformerTests: QuickSpec {
    override func spec() {
        describe("TransformListOfPeople") {
            it("should transform json of people") {
                let expectedPerson = Person(id: 1, name: "someName", phone: "somePhone")
                let jsonResponse = JSON([["id": 1, "name":"someName", "phone": "somePhone"]])
                let actualPerson = PeopleTransformer.transformPeopleFrom(JSON: jsonResponse).first

                expect(expectedPerson) == actualPerson
            }

            it("should put an empty string a JSON field is missing, or -1 for ID") {
                let expectedPerson = Person(id: -1, name: "", phone: "")
                let jsonResponse = JSON([["Unexpected":"field"]])
                let actualPerson = PeopleTransformer.transformPeopleFrom(JSON: jsonResponse).first

                expect(expectedPerson) == actualPerson
            }    
        }
    }
}