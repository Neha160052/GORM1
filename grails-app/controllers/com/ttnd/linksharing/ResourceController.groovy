package com.ttnd.linksharing


import grails.converters.JSON

class ResourceController {
    // static scaffold =Resource

    def index() {
        render("sucess")
    }

    def search(){

    }

    def show(long id) {
        Resource resource = Resource.get(id)
        [resource: resource]
    }

    def delete() {
        long resourceId=params.long('resourceId')
        println resourceId
        Resource resource = Resource.get(resourceId)
        if(resource){
            resource.delete(flush: true)
        }
        redirect(controller: 'login',action: 'index')


    }

    def rating(long resourceId,int rate){
        Map resultInfo = [1:"one"]
        User user=session.user
        Resource resource=Resource.get(resourceId)
        ResourceRating resourceRating1=ResourceRating.findByCreatedByAndResource(user,resource)
        if(!resourceRating1) {
            ResourceRating resourceRating = new ResourceRating(resource: resource, createdBy: user, score: rate)
            if (resourceRating.save(flush: true)) {
                flash.message = "your rating successfully saved"
            } else {
                flash.error = "Rating is not saved"
            }
        }

        render(resultInfo as JSON)
    }

}
