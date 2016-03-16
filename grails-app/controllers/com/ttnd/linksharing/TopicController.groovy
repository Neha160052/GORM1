package com.ttnd.linksharing

import co.ResourceSearchCO
import grails.converters.JSON
import vo.TopicVO

class TopicController {
    // static scaffold = true
    def mailService

    def index() {
        Topic topic=Topic.findByName(params.id)
        print topic
        render(view: "show")
    }

    def trendingTopic() {
        List<TopicVO> vo = Topic.getTrendingTopics()
        vo.each {
            render "id=${it.id},name=${it.name},createdBy=${it.createdBy},visibilty=${it.visibility},count=${it.count}"
        }
    }

    def edit(){
        Topic topic=Topic.get(params.long('id'))
        topic.name=params.topicName
        topic.visibility=Visibility.getEnum(params.visibility)
        if(topic.save(flush: true)){
            render "success"
        }else{
            render "Not Success"
        }
    }


    def show(ResourceSearchCO co) {
        Topic topic = Topic.read(co.topicId)
        if (!topic) {
            redirect(controller: "Login", action: "index")
            render "flash.message=" This Topic does not exist ""
        } else {
            if (topic.visibility == Visibility.PUBLIC) {
                return [topic:topic]
            } else {
                if (Subscription.findByTopicAndUser(session.user, topic)) {
                    render "Success"
                } else {
                    render flash.error = "You have to Login first to see this Topic"
                    redirect(controller: "Login", action: "index")
                }
            }
        }
    }

    def save(String topicName, String visibility) {
        println topicName
        println visibility
        Topic topic = new Topic(name: topicName, createdBy: session.user, visibility: Visibility.getEnum(visibility))
         println topic.validate()
        if (topic.validate()) {
            topic.save()
            flash.message = "Topic successfully created"
        } else {
            if(topicName){
                flash.error="This topic already exist"
            }else{
                flash.error="Topic Name can not be null"
            }

        }
        forward(controller: "login",action: "loginHandler" ,params: [username:session.user.username,password:session.user.password])
    }

    def updateTopic(String topicUpdatedName,String topicName,long topicId){
        if(topicUpdatedName){
            Topic topic=Topic.get(topicId)
            topic.name=topicUpdatedName
            if(topic.save(flush: true)){
                flash.message="Topic updated successfully"
            }else{
                flash.error="Topic not updated successfully"
            }
        }else{
              flash.error="Topic name can not be blank"
        }
        redirect(controller: "login" ,action: "index")
    }

    def sendInvitation(){
        User user=User.findByEmail(params.email)
        if(user){
            mailService.sendMail {
                to params.email
                from "913nehasinghal@gmail.com"
                subject "Hello John"
                body 'this is some text'
            }
            flash.message="your Invitation has been sent"
        }else {
           flash.error="User not found with email Id - ${params.email}"
        }
        forward(controller: "login",action: "loginHandler" ,params: [username:session.user.username,password:session.user.password])
    }

    def  changeVisibility(long topicId,String visibilityString){
        Topic topic=Topic.get(topicId)
        Map resultInfo = [1:"one"]
        topic.visibility=Visibility.getEnum(visibilityString)
        if(topic.save(flush: true)){
            flash.message="Visibility updated successfully"
        }else{
            flash.error="Visibility updated successfully"
        }
        render(resultInfo as JSON)
        }

    def delete(Long topicId) {
        Topic topic = Topic.get(topicId)
        User user = session.user
        if (topic && user && user.hasTopicRight(topicId)) {
            topic.delete(flush: true)
            flash.message = "Successfully topic delete"
        } else {
            flash.error = "Topic not found"
        }
       redirect(controller: 'login', action: 'index')
    }

}
