package com.ttnd.linksharing

class LinkResourceController {
    static scaffold = true



    def saveLinkResource(String url, String discription, String topicName){
        User user=session.user
        Topic topic=Topic.findByName(topicName)
        println topicName
        Resource linkResource=new LinkResource(url: url,discription:discription,createdBy: user,topic: topic)
        if(linkResource.validate()){
            linkResource.save(flush: true,failOnError: true)
            flash.message="Link Resource Saved"

        }
        else{
            def err
            if(linkResource.hasErrors()) {
                err = linkResource.errors.allErrors.collect { message(error: it) }.join(',')
            }
            flash.error=err
// render "problrmmmmmmmmmm"
           // redirect(controller: 'user',action: 'index')

        }
        forward(controller: "login",action: "loginHandler" ,params: [username:session.user.username,password:session.user.password])
    }
}
