package com.ttnd.linksharing

import CO.ResourceSearchCO
import VO.RatingInfoVO

abstract  class Resource  {
    String discription
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static transients = ['ratingInfo']

    static hasMany = [readingitem:ReadingItem, rating:ResourceRating]
    static belongsTo = [topic:Topic]

    static constraints = {
        discription(blank:false)
    }

    RatingInfoVO getRatingInfo(){
        List result = ResourceRating.createCriteria().get {
            projections {
                sum('score')
                count('id', 'totalVotes')
                avg('score')
            }
            eq('resource', this)
            order('totalVotes', 'desc')
        }

        new RatingInfoVO(totalScore: result[0], totalVotes: result[1], averageScore: result[2])

    }
    static namedQueries = {
        search { ResourceSearchCO co->
            if(co.topicId){
                eq('topic.id',co.topicId)
                'topic'{
                eq('visibility',co.getVissiblityEnum())
                }
            }
        }
    }

}
