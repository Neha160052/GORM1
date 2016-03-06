package CO
import com.ttnd.linksharing.Visibility

class ResourceSearchCO extends SearchCO{
    long topicId
    String visibility

    Visibility getVissiblityEnum() {
        Visibility.getEnum(visibility)
    }
}
