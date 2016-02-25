package com.ttnd.linksharing

class UserController {
    //static scaffold = User

    def index() {
        render(session.user.username)
      //  render "User Dashbord"
    }

    def register() {
        User user = new User(firstName: "Ashu",lastName: "Singhal",email: "ashu@gmail.com",username: "Ashu", password: 'test',confirmPassword: 'test',active: true)
        if (user.validate()) {
            user.save()
            render "Saved object"
        } else {
            render "${user.errors.allErrors.collect { message(error: it) }.join(',')}"
        }

    }
}
