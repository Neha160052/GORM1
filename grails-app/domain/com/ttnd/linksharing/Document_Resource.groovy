package com.ttnd.linksharing

class Document_Resource extends Resource {
    String filePath
    Date dateCreated
    Date lastUpdated

    static constraints = {
        filePath(blank:false)
    }
}
