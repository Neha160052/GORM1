package co
import com.ttnd.linksharing.Visibility

class ResourceSearchCO extends SearchCO{
    long resourceId
    long topicId
    String visibility

    Visibility getVissiblityEnum() {
        Visibility.getEnum(visibility)
    }
}
