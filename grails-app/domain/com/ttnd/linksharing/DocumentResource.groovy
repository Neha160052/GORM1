package com.ttnd.linksharing

class DocumentResource extends Resource {
    String fileName
    String filePath

    static constraints = {
        filePath(blank:false)
    }
}
