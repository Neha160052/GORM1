package co

import com.ttnd.linksharing.User


class TopicCO {
    Long userId
    Long topicId
    String topicName
    String topicUpdatedName
    String visibilityString
    User getUser(){
        return User.get(userId)
    }
}
