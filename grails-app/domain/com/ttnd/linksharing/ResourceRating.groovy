package com.ttnd.linksharing

class ResourceRating {
    Integer score
    User createdBy
    Resource resource

    static constraints = {
        score(min: 1,max: 5)
      //  user(unique: ['resource'])
    }


    @Override
    public String toString() {
        return "ResourceRating{" +
                "createdBy=" + createdBy +
                '}';
    }
}
