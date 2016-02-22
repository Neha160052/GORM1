package com.ttnd.linksharing

class UserController {
   //static scaffold = User

    def index() {
        render "User Dashbord"
        render(session.user.username)
    }

    def register(){

    }
}
