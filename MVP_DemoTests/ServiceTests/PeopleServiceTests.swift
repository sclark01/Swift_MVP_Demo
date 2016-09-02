import Foundation
import Quick
import Nimble
import OHHTTPStubs

@testable import MVP_Demo

class PeopleServiceTests : QuickSpec {
    override func spec() {

        let expectedPerson = Person(id: 0, name: "Some Name", phone: "Some Phone")

        beforeEach {
            stub(isHost("localhost") && isPath("/listAll") && isMethodGET()) { request in
                let obj = [[
                        "id" : expectedPerson.id,
                        "name" : expectedPerson.name,
                        "phone" : expectedPerson.phone
                    ],
                    [
                        "id" : 1,
                        "name" : "Another Name",
                        "phone" : "Another Phone"
                    ]]
                return OHHTTPStubsResponse(JSONObject: obj, statusCode: 200, headers: nil)
            }
        }

        afterEach {
            OHHTTPStubs.removeAllStubs()
        }

        describe("get people") {
            it("should get all people from list all endpoint") {
                let peopleService = PeopleService()
                var completionCalled = false
                var actualPeople: [Person] = []

                peopleService.getPeople { people in
                    completionCalled = true
                    actualPeople = people
                }

                expect(completionCalled).toEventually(beTrue())
                expect(actualPeople.count).toEventually(equal(2))
                expect(actualPeople.first?.id).toEventually(equal(expectedPerson.id))
                expect(actualPeople.first?.name).toEventually(equal(expectedPerson.name))
            }
        }
    }
}