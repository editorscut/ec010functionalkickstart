public let maggie = Person(name: "Maggie")
public let annabelle = Person(name: "Annabelle", contact: Contact(email: Email("dog")))
public let daniel = Person(name: "Daniel", contact: Contact(email: Email("daniel"), location: Location(city: "Shaker Heights")))
public let kimberli = Person(name: "Kimberli", contact: Contact(email: Email("kimberli"), location: Location(city: "Shaker Heights", street: "1313 Mockingbird Lane")))


public struct Person {
    public let name: String
    public let contact: Contact?
    
    public init(name: String, contact: Contact? = nil) {
        self.name = name
        self.contact = contact
    }
}

extension Person: CustomStringConvertible {
    public var description: String {
        if let contact = contact {
            return "\(name): contact: \(contact)"
        } else {
            return "\(name)"
        }
    }
}

public struct Contact {
    public let email: Email
    public let location: Location?
    
    public init(email: Email, location: Location? = nil) {
        self.email = email
        self.location = location
    }
}

extension Contact: CustomStringConvertible {
    public var description: String {
        if let location = location {
            return "email: \(email), location: \(location)"
        } else {
            return "email: \(email)"
        }
    }
}

public struct Email {
    public let prefix: String
    
    public init(_ prefix: String) {
        self.prefix = prefix
    }
}

extension Email: CustomStringConvertible {
    public var description: String {
        "\(prefix)@example.com"
    }
}

public struct Location {
    public let city: String
    public let street: String?
    
    public init(city: String, street: String? = nil) {
        self.city = city
        self.street = street
    }
}

extension Location: CustomStringConvertible {
    public var description: String {
        if let street = street {
            return "\(street), \(city)"
        } else {
            return "\(city)"
        }
    }
}

