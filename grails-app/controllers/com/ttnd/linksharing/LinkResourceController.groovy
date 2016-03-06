package com.ttnd.linksharing

class LinkResourceController {
    static scaffold = true

    def index() { }

    def saveLinkResource(String url, String discription, Integer topicName){
        User user=session.user
        Topic topic=Topic.findById(topicName)
        println topicName
        Resource linkResource=new LinkResource(url: url,discription:discription,createdBy: user,topic: topic)
        if(linkResource.validate()){
            linkResource.save(flush: true)
            flash.message="Link Resource Saved"
            render flash.message
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
