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


    static List getTopPosts() {
        List resourceIdWithMaximumRatings = Resource.createCriteria().list {

            projections{
                rating{
                    count('id','rCount')
                }
            }
            groupProperty('id')
            order('rCount')
            maxResults(5)
        }.collect{
            it[1]
        }
        return Resource.getAll(resourceIdWithMaximumRatings)
    }

    static List<Resource> getRecentResources(){
        List<Resource> recentResources=Resource.createCriteria().list(max:2,offset:0,sort:'lastUpdated',order:'desc') {}
    }
    static namedQueries = {
        search { ResourceSearchCO co->
            if(co.topicId){
                topic{
                    eq('id',co.topicId)
                }
            }
            if(co.visibility){
                topic{
                    eq('visibility',Visibility.getEnum(co.visibility))
                }
            }

        }
    }

      static boolean isLinkResource(Long id){
         Resource resource=Resource.get(id)
        if(resource.class.equals(LinkResource)){
            println "1111111111111111111111111"
            return true
        }else{
            println "222222222222222222222222"
            return false
        }

    }

}
