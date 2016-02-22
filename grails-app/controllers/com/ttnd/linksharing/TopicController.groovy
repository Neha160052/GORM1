package com.ttnd.linksharing

class TopicController {
   // static scaffold = true

    def index() { }

   def show(int id){
        Topic topic=Topic.get(id)
        if(!topic){
            redirect(controller: "Login",action: "index")
            flash.message="This Topic does not exist"
        }
        else{
           if(topic.visibility==Visibility.PUBLIC){
               render"Sucsess"
           }
            else {
               if(Subscription.findByTopicAndUser(session.user,topic)){
                   render"Success"
               }
               else{
                   redirect(controller: "Login",action: "index")
                   flash.error=""
               }
           }
        }
    }

   /* def save(String topic,String seriousness){

    }*/
}
