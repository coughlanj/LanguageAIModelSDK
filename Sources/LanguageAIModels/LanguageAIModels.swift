// The Swift Programming Language
// https://docs.swift.org/swift-book
public struct TranslatedItemAPI: Codable, Identifiable {
    public let input: String
    public let output: String
    public let position: Int
    public var topic: String?
    public let imageIdentifier: String?

    public var id: String {
        return input + output
    }
}


public struct VerbAPI: Codable {
    public let sentences: [TranslatedItemAPI]
    public let conjugations: [ConjugationAPI]
    public let input: String
    public let output: String
    public let position: Int
}

public class ConjugationAPI: Codable {
    public let pronoun: String
    public let value: String
    public let pronounTranslated: String
    public let valueTranslated: String
    public let priority: Int
}

public struct LessonAPI: Codable {
    public let identifier: String
    public let verbs: [VerbAPI]
    
    public init(identifier: String, verbs: [VerbAPI]) {
        self.identifier = identifier
        self.verbs = verbs
    }
}

public class LessonSuggestionsAPI: Codable {
    public let topics: [LessonSuggestionAPI]
}


public class LessonSuggestionAPI: Codable, Identifiable {
    public let input: String
    public let output: String
    public let identifier: String
    public let position: Int
    public let type: String

    public var id: String {
        return identifier
    }
}

public class LessonPlansAPI: Codable {
    public let topics: [LessonPlanAPI]
    
    public init(topics: [LessonPlanAPI]) {
        self.topics = topics
    }
}


public class LessonPlanAPI: Codable, Identifiable {
    public let input: String
    public let output: String
    public let identifier: String
    public let position: Int

    public var id: String {
        return identifier
    }
    
    public init(input: String, output: String, identifier: String, position: Int) {
        self.input = input
        self.output = output
        self.identifier = identifier
        self.position = position
    }
}
