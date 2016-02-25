package com.ttnd.linksharing

import CO.ResourceSearchCO
import VO.TopicVO

class TopicController {
   // static scaffold = true

    def index() { }

    def trendingTopic(){
        TopicVO vo=Topic.getTrendingTopics()
        render"id=${vo.id},name=${vo.name},createdBy=${vo.createdBy},visibilty=${vo.visibility},count=${vo.count}"
    }

   def show(ResourceSearchCO co){
        Topic topic=Topic.read(co.topicId)
        if(!topic){
            redirect(controller: "Login",action: "index")
            render"flash.message="This Topic does not exist""
        }
        else{
           if(topic.visibility==Visibility.PUBLIC){
               render"Sucsess"
           }
            else {
               if(Subscription.findByTopicAndUser(session.user,topic)){
                   render"Success"
               }
               else {
                  render flash.error = ""
                   redirect(controller: "Login", action: "index")
               }
           }
        }
    }

   def save(String topicName,String seriousness){
      Topic topic=Topic.findByName(topicName)
       if (topic.createdBy==session.user){
         
       }
    }
}
