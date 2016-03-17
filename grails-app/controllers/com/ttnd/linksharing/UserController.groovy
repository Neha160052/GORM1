package com.ttnd.linksharing

import co.RegisterCO
import co.SearchCO
import co.UserSearchCO
import vo.UserVO

class UserController {
    //static scaffold = User
    def mailService

    def show(SearchCO searchCO) {
        searchCO.max = searchCO.max ?: 10
        searchCO.offset = searchCO.offset ?: 0

        User currentUser = session.user

        render(view: 'index', model: [linkResourceCO   : null, trendingTopics: Topic?.getTrendingTopics(),
                                      subscribedTopics : currentUser?.subscribedTopic,
                                      currentUser      : currentUser ?: null,
                                      readingItems     : currentUser?.getInboxItems(searchCO),
                                      totalReadingItems: currentUser?.getTotalReadingItem(),
                                      searchCO         : searchCO])
    }

    def forgetPassword(){
        render(template: 'forgetPassword')
    }

    def toggleActive(Long id) {
        User user = User.get(id)

        if (user && (!user.admin)) {
            user.active = !user.active
            if (user.save(flush: true, validate: false)) {
                flash.message = "Toggle successfully"
            } else {
                flash.error = "Can't toggle successfully ${user.errors.allErrors}"
            }
        } else {
            flash.error = "Can't toggle successfully"
        }
        redirect(controller: 'user', action: "list")

    }
    def list(UserSearchCO userSearchCO) {
        List<UserVO> userVOList = []
        userSearchCO.max = userSearchCO.max ?: 20
        userSearchCO.offset = userSearchCO.offset ?: 0
        if (session.user?.admin) {
            List users = User.search(userSearchCO).list([sort  : userSearchCO.sort, order: userSearchCO.order, max: userSearchCO.max,
                                                         offset: userSearchCO.offset])
            users.each { user ->
                userVOList.add(new UserVO(id: user.id, username: user.username, email: user.email,
                        firstName: user.firstName,
                        lastName: user.lastName, active: user.active))
            }
             println userVOList.size()
            println userSearchCO
            println users.size()
            render(view: 'list', model: [users: userVOList, userSearchCO: userSearchCO, totalCount: users.size()])
        } else {
            redirect(controller: 'login', action: 'index')
        }
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
       //     user.active=true
            if(!user.save(flush: true)){
                flash.error="Validation fail"
                render(view: '/login/index',model: [topPosts:Resource.getTopPosts(),recentResources:Resource.getRecentResources(),registerCO:user])
            }else{
                flash.message = "User successfully created"
                redirect(controller: 'login', action: 'index')
            }
        }

    }

    def changeProfile(){
        User user=session.user
        def topics=user.topics
        render(view:'changeProfile',model:[topics:topics])
    }

    def updateProfile(){
        String userName=session.user.username
        User user=User.findByUsername(userName)
        user.firstName=params.firstName
        user.lastName=params.lastName
        user.username=params.username
        if(user.save(flush: true)){
            session.user=user
            flash.message="your profile successfully updated"
        }else{
            def err
            if(user.hasErrors()) {
                err = user.errors.allErrors.collect { message(error: it) }.join(',')
            }
            flash.error=err
        }
        render(view: 'changeProfile')
    }

    def changePassword(){
        String userName=session.user.username
        User user=User.findByUsername(userName)
        user.password=params.password
        user.confirmPassword=params.confirmPassword
        if(user.save(flush: true)){
            session.user=user
            flash.message="Your password updated"
        }else{
            def err
            if(user.hasErrors()) {
                err = user.errors.allErrors.collect { message(error: it) }.join(',')
            }
            flash.error=err
        }
        render(view: 'changeProfile')
    }

    def sendInvitation(){
        User user=User.findByEmail(params.email)
        if(user){
            mailService.sendMail {
                to params.email
                from "913nehasinghal@gmail.com"
                subject "Invitation For Topic ${params.topicName}"
                body 'this is some text'
            }
            flash.message="your Invitation has been sent"
        }else {
            flash.error="User not found with email Id - ${params.email}"
        }
        redirect(controller: "login",action: "index")
    }

    def admin(){
      List<User> users=User.list()
        return [users:users]
    }

    def update(long id){
        User user=User.get(id)
        user.active=~(user.active)
        println user.active
        if(user.save(flush: true)){
            flash.message="Success"
        }else{
            flash.error="Not success"
        }
        forward(action: 'admin')
    }

    def markAsRead(long resourceId){
        User user=session.user
        Resource resource=Resource.get(resourceId)
        ReadingItem readingItem=ReadingItem.findByUserAndResource(user,resource)
        readingItem.delete(flush: true)
//        if(readingItem.save(flush: true)){
//            flash.message="Mark as Read"
//        }else{
//            flash.error="Not Mark as Read"
//        }
        redirect(controller: "login",action: "index")
    }

    def profile(){
        User user=User.findByUsername(params.userId)
        println user.properties
        if(user){
          return  [user:user]
        }
    }
}
