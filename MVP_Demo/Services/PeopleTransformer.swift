import Foundation
import SwiftyJSON

struct PeopleTransformer {
    static func transformPeopleFrom(JSON json: JSON) -> [Person] {
        let jsonArray = json.arrayValue
        return jsonArray.map { json in
            Person(id: json["id"].intValue, name: json["name"].stringValue, phone: json["phone"].string ?? "")
        }
    }
}
