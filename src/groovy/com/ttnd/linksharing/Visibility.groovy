package com.ttnd.linksharing

/**
 * Created by neha on 24/2/16.
 */
enum Visibility {
    PUBLIC,
    PRIVATE


   static Visibility getEnum(String visibility){
       return Visibility.valueOf(visibility.toUpperCase())
   }
}