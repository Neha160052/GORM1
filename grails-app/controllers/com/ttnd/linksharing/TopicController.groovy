package com.ttnd.linksharing

import co.ResourceSearchCO
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

}
