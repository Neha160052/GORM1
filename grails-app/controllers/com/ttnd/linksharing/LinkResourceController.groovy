package com.ttnd.linksharing

class LinkResourceController {
    static scaffold = true

    def index() { }

    def saveLinkResource(String url, String discription, String topicName){
        User user=session.user
        Topic topic=Topic.findByName(topicName)
        println topicName
        Resource linkResource=new LinkResource(url: url,discription:discription,createdBy: user,topic: topic)
        if(linkResource.validate()){
            linkResource.save(flush: true)
            flash.message="Link Resource Saved"
            forward controller: "login", action: "loginHandler"
        }
        else{
            def err
            if(linkResource.hasErrors()) {
                err = linkResource.errors
            }
            render text: "Link Resource not Saved"+err
// render "problrmmmmmmmmmm"
           // redirect(controller: 'user',action: 'index')

        }
    }
}
