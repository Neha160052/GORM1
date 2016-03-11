package com.ttnd.linksharing

import CO.RegisterCO
import grails.validation.ValidationException

class UserController {
    //static scaffold = User

    def index() {
        render(session.user?.username)
      //  render "User Dashbord"
    }

    def forgetPassword(){
        render(template: 'forgetPassword')
    }
    def register(RegisterCO CO){
        if(CO.hasErrors()){
            println CO.properties
            flash.error="Validations fail"
            render(view: '/login/index',model: [topPosts:Resource.getTopPosts(),recentResources:Resource.getRecentResources(),registerCO:CO])
        }else{
            User user=new User(CO.properties)
           // user.photo=CO.userPhoto.bytes
            user.active=true
            if(!user.save(flush: true)){
                flash.error="Validation fail"
                render(view: '/login/index',model: [topPosts:Resource.getTopPosts(),recentResources:Resource.getRecentResources(),registerCO:user])
            }else{
                flash.message = "User successfully created"
                session.user = user
                redirect(controller: 'login', action: 'loginHandler',params: [username:CO.username,password:CO.password])
            }
        }

    }

}
