package CO
import com.ttnd.linksharing.Visibility

/**
 * Created by neha on 24/2/16.
 */
class ResourceSearchCO extends SearchCO{
    long topicId
    String visibility

    Visibility getVissiblityEnum() {
        Visibility.getEnum(visibility)
    }
}
