package com.ttnd.linksharing

class Link_Resource extends Resource{
    String url

    static constraints = {
        url(url: true,blank: false)
    }

    String toString(){
        return url
    }

}
