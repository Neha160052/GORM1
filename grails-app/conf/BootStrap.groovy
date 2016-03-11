import com.ttnd.linksharing.ReadingItem
import com.ttnd.linksharing.Resource
import com.ttnd.linksharing.ResourceRating
import com.ttnd.linksharing.Seriousness
import com.ttnd.linksharing.Subscription
import com.ttnd.linksharing.Topic
import com.ttnd.linksharing.User
import com.ttnd.linksharing.Visibility
import com.ttnd.linksharing.LinkResource
import com.ttnd.linksharing.DocumentResource

class BootStrap {

    def init = { servletContext ->
        List<User> users = createUsers()
        List<Topic> topics = createTopics()
        createResources()
        subscribeTopics(users,topics)
        createReadingItems(users)
        createResourceRatings(users)


    }

    List<User> createUsers() {
        List<User> users = []
        User user = User.get(1)
        if (user == null) {
            users.add(createAdmin())
            users.add(createActiveUser())
        } else {
            log.info("--User Table already have some data--")
        }
        users
    }

    User createAdmin() {
        User admin = new User(firstName: "Neha", lastName: "Singhal", username: "Neha", email: "neha@gmail.com",confirmPassword: "123456", password: "123456", admin: 1)
        if (admin.save()) {
            log.info "User ${admin} saved successfully"
        } else {

            log.error "Error saving user : ${admin.errors.allErrors}"
        }
        admin
    }

    User createActiveUser() {

        User user = new User(firstName: "Swati", lastName: "Singhal", username: "Swati", email: "swati@gmail.com",confirmPassword: "*123*11", password: "*123*11", admin: 0, active: 1)
        if (user.save()) {
            log.info("User ${user} saved successfully")
        } else {
            log.error("Error saving user : ${user.errors.allErrors}")
        }
        user
    }


    List<Topic> createTopics() {
        List<Topic> topics = []
        if (Topic.count() == 0) {
            (1..2).each {
                User user = User.get(it)
                topics.addAll(createUserTopics(user))
            }

        }
        topics
    }

    List<Topic> createUserTopics(User user) {
        List<Topic> topics = []
        (1..5).each {
            Topic topic = new Topic(name: "Topic${user.id}${it}", createdBy: user, visibility: Visibility.PUBLIC)
            if (topic.save()) {
                topics.add(topic)
                log.info("Topic${it} is saved")
            } else {
                log.error("Error Saving Topic:${topic.errors.allErrors}")
            }
        }
        topics
    }

    def createResources() {
        List<LinkResource> linkResources = []
        List<DocumentResource> documentResources = []
        if (Resource.count() == 0) {
            (1..10).each {

                linkResources.addAll(createLinkResources(Topic.get(it)))
                documentResources.addAll(createDocumentResources(Topic.get(it)))

            }
        }


    }

    List<LinkResource> createLinkResources(Topic topic) {
        List<LinkResource> linkResources = []
        (1..2).each {
            LinkResource linkResource = new LinkResource(topic: topic, createdBy: topic.createdBy, discription: "${topic.name}'s url Description", url: "https://www.${topic.name}${it}.com")
            if (linkResource.save()) {
                linkResources.add(linkResource)
                log.info "${topic} ${it}"
            } else {
                log.error("${linkResource.errors.allErrors}")
            }
        }
        linkResources
    }

      List<DocumentResource> createDocumentResources(Topic topic) {
          List<DocumentResource> documentResources = []
          (1..2).each {
              DocumentResource documentResource = new DocumentResource(topic: topic, createdBy: topic.createdBy, discription: "${topic.name} Description of document", filePath: "/home/neha/Desktop/${topic}${it}",fileName: "Document${it}")
              if (documentResource.save()) {
                  documentResources.add(documentResource)
                  log.info "${topic} ${it}"
              } else {
                  log.error("${documentResource.errors.allErrors}")
              }

          }
          documentResources
      }

    def subscribeTopics(List<User> users,List<Topic> topics) {
        users.each {
            User user = User.findByUsername(it)
            topics.each {
                Topic topic = Topic.findByName(it)
                if (user != topic.createdBy) {
                    subscribeTopic(user, topic)
                }
            }
        }
    }

    def subscribeTopic(User user, Topic topic) {
        Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)
        if (subscription.save()) {
            log.info("${topic} ${user} subscription saved")
        } else {
            log.error("${subscription.errors.allErrors}")
        }

    }

    def createReadingItems(List<User> users) {
        users.each {
            User user = User.findByUsername(it)
            (1..40).each {
                Resource resource = Resource.get(it)
                Topic topic=resource.topic
                if (user != resource.createdBy) {
                    if(Subscription.findByUserAndTopic(user,topic))
                    readItem(user, resource)
                }
            }
        }
    }

    def readItem(User user, Resource resource) {
        ReadingItem readingItem = new ReadingItem(resource: resource, user: user, isRead: false)
        if (readingItem.save()) {
            log.info("${resource} is marked as Read for ${user}")
        } else {
            log.error("${readingItem.errors.allErrors}")
        }
    }

    def createResourceRatings(List<User> users){
        users.each {
            User user=User.findByUsername(it)
            (1..40).each {
                ReadingItem readingItem=ReadingItem.get(it)
                if(user!=readingItem.user)
                {
                    createRating(user,readingItem)
                }
            }
        }

    }

    def createRating(User user,ReadingItem readingItem){
        ResourceRating resourceRating=new ResourceRating(createdBy: user,resource: readingItem.resource,score: 3)
        if(resourceRating.save()){
            log.info("Saved Rating")

        }
        else{
            log.error("${readingItem.errors.allErrors}")
        }
    }
    def destroy = {
    }
}
