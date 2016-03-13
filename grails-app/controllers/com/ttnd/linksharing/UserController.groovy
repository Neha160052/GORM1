package com.ttnd.linksharing

import co.RegisterCO

class UserController {
    //static scaffold = User
    def mailService
    def index() {
        render(session.user?.username)
      //  render "User Dashbord"
    }

    def forgetPassword(){
        render(template: 'forgetPassword')
    }

    def mailDemo(){
        println params.email
        if(params.email) {
            mailService.sendMail {
                to params.email
                from "913nehasinghal@gmail.com"
                subject "Your new Password"
                body 'your new Password-asdfghjkl'
            }
            User user=User.findByEmail(params.email)
            println user
            user.password="asdfghjkl"
            user.save(flush: true,failOnError: true)
            flash.message="check your email id for new Password"

        }else{
            flash.error="Invalid Email Id"
        }
        redirect(controller: "login", action: "index")
    }
    def register(RegisterCO CO){
        if(CO.hasErrors()){
            println CO.properties
            flash.error="Validations fail"
            render(view: '/login/index',model: [topPosts:Resource.getTopPosts(),recentResources:Resource.getRecentResources(),registerCO:CO])
        }else{
            User user=new User(CO.properties)
         //  user.photo= co.userPhoto.getBytes()
       //     println co.userPhoto.class
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
