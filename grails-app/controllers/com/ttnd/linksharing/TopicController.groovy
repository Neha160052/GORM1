package com.ttnd.linksharing

import CO.ResourceSearchCO
import VO.TopicVO

class TopicController {
    // static scaffold = true

    def index() {
        Topic topic=Topic.findByName(params.id)
        print topic
        render(view: "show")
    }

    def trendingTopic() {
        List<TopicVO> vo = Topic.getTrendingTopics()
        vo.each {
            render "id=${it.id},name=${it.name},createdBy=${it.createdBy},visibilty=${it.visibility},count=${it.count}"
        }
    }

    def show(ResourceSearchCO co) {
        Topic topic = Topic.read(co.topicId)
        if (!topic) {
            redirect(controller: "Login", action: "index")
            render "flash.message=" This Topic does not exist ""
        } else {
            if (topic.visibility == Visibility.PUBLIC) {
                return [topic:topic]
            } else {
                if (Subscription.findByTopicAndUser(session.user, topic)) {
                    render "Success"
                } else {
                    render flash.error = "You have to Login first to see this Topic"
                    redirect(controller: "Login", action: "index")
                }
            }
        }
    }

    def save(String topicName, String visibility) {
        Topic topic = new Topic(name: topicName, createdBy: session.user, visibility: Visibility.getEnum(visibility))
        if (topic.validate()) {
            topic.save()
            render "Success"
        } else {
            render "Error"
        }
    }
}
