//
//  PromptFactory.swift
//  LanguageAI
//
//  Created by James Coughlan on 01/11/2023.
//

import Foundation

public struct PromptFactory {
    static let jsonForceText = "Always only return JSON, do not add any other text. The JSON should be in the provided schema. All elements of the JSON are required. Pay attention to the commented code which indicated what each value is used for:"

    struct Lesson {
        static let lessonIntroduction = "Provide a list of 3 verbs, their conjugations, and 3 sentences related to the topic identifier '%@' that a beginner language learner might want to study, in order of importance. Make sure that the verbs are limited to two words. Examples would be 'to jump' or 'to laugh'. "
        static let schema = """
{
  "type": "object",
  "properties": {
    "verbs": { // a list of verbs to study
      "type": "array",
      "items": { //
        "type": "object",
        "properties": {
          "position": {
            "type": "integer"
          },
          "input": {
            "type": "string"
          },
          "output": {
            "type": "string"
          },
          "conjugations": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "pronoun": {
                  "type": "string"
                },
                "value": {
                  "type": "string"
                },
                "priority": {
                  "type": "integer"
                },
                "pronounTranslated": {
                  "type": "string"
                },
                "valueTranslated": {
                  "type": "string"
                }
              },
              "required": ["pronoun", "value", "priority", "pronounTranslated", "valueTranslated"]
            }
          },
          "sentences": {
            "type": "array",
            "items": {
              "type": "object",
              "properties": {
                "position": {
                  "type": "integer"
                },
                "input": {
                  "type": "string"
                },
                "output": {
                  "type": "string"
                },
                "imageIdentifier": { // This should be one of the values in the array %@, whichever is most relevant to the sentence
                  "type": "string"
                },
                "topic": { // This should be a one word description of the sentence
                  "type": "string"
                }
              },
              "required": ["position", "input", "output", "imageIdentifier", "topic"]
            }
          }
        },
        "required": ["position", "input", "output", "conjugations", "sentences"]
      }
    },
    "identifier": { // this should always be %@
      "type": "string"
    }
  },
  "required": ["verbs", "identifier"]
}


"""
    }
    
    public static func buildLessonPrompt(topic: String, images: String) -> String {
        String(format: Lesson.lessonIntroduction, topic) + jsonForceText + String(format: Lesson.schema, images, topic)
    }
}
