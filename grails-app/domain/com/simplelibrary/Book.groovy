package com.simplelibrary

class Book {
String title
    String author
    String description

    static belongsTo = [user:User]
User user
    static searchable = {
        mapping {
            boost 2.0
            spellCheck "include"
        }
    }
    static constraints = {
        title blank: false
        author blank: false
        description maxSize: 63760
    }
    static mapping ={
        description type: 'text'
    }
}
