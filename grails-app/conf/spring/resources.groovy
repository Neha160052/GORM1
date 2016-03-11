import com.ttnd.linksharing.DemoBean

// Place your Spring DSL code here
beans = {

    myBean(com.ttnd.linksharing.DemoBean){bean->
        bean.scope='prototype'
        name="ABSD"

    }

//    myBeanConstructor(com.ttnd.linksharing.DemoBean,"Neha"){
//
//    }
}
