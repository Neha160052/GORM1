package com.ttnd.linksharing
/**
 * Created by neha on 7/3/16.
 */
class DemoBean {
    String name
    int age

    DemoBean(){
        println("Default constructor")
    }

    DemoBean(String name){
        println("Contructor callling:${name}")
        this.name=name
    }

    void setName(String name) {
        println("Calling Setter::Setting Name=${name}")
        this.name = name
    }

    String getName() {
        return name
    }


    void setAge(int age) {
        this.age = age
        println("Calling setter::Setting age=${age}")
    }

}
