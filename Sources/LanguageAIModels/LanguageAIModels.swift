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
}

public class LessonSuggestionsAPI: Codable {
    let topics: [LessonSuggestionAPI]
}


public class LessonSuggestionAPI: Codable, Identifiable {
    let input: String
    let output: String
    let identifier: String
    let position: Int
    let type: String

    public var id: String {
        return identifier
    }
}

public class LessonPlansAPI: Codable {
    let topics: [LessonPlanAPI]
}


public class LessonPlanAPI: Codable, Identifiable {
    let input: String
    let output: String
    let identifier: String
    let position: Int

    public var id: String {
        return identifier
    }
}
