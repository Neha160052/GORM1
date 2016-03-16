package com.ttnd.linksharing

enum Seriousness {
    SERIOUS("Serious"),
    VERY_SERIOUS("Very serious"),
    CASUAL("Casual")

    final String value

    Seriousness(String value) {
        this.value = value
    }
    String toString() { value }

    String getKey() { name() }

    static Seriousness getEnum(String visibility) {
        return Seriousness.valueOf(visibility.toUpperCase())
    }
    }