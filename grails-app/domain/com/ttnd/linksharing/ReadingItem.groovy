package com.ttnd.linksharing

class ReadingItem {
    Resource resource
    User user
    Boolean isRead
    Date dateCreated
    Date lastUpdated

    static belongsTo = [resource:Resource]

    static constraints = {
        user(unique: 'resource')
    }
    String toString(){
        return "${resource} ${user}"
    }
}
