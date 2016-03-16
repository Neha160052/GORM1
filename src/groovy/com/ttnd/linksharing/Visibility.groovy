package com.ttnd.linksharing


enum Visibility {
    PUBLIC("Public"),
    PRIVATE("Private")

    final String value

    Visibility(String value) {
        this.value = value
    }

    String toString() { value }

    String getKey() { name() }


   static Visibility getEnum(String visibility){
       return Visibility.valueOf(visibility.toUpperCase())
   }
}