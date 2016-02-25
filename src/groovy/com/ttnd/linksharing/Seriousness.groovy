package com.ttnd.linksharing
/**
 * Created by neha on 24/2/16.
 */
enum Seriousness {
    SERIOUS,
    VERY_SERIOUS,
    CASUAL

    static Seriousness getEnum(String visibility) {
        return Seriousness.valueOf(visibility.toUpperCase())
    }
    }