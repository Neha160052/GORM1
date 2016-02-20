package com.ttnd.linksharing

abstract  class Resource  {
    String discription
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingitem:ReadingItem, rating:ResourceRating]
    static belongsTo = [topic:Topic]

    static constraints = {
        discription(blank:false)
    }


}
