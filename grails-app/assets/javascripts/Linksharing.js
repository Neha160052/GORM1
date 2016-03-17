$(".unsubscribe").click(function (e) {
    e.preventDefault();
    var topicId = $(this).attr("topicId")
    $.ajax({
        url:"/Linksharing/subscription/delete",
        data:{topicId:topicId},
        success: function (result) {
            location.reload();
        }
    })
})



$(".subscribe").click(function (e){
    e.preventDefault();
    var topicId=$(this).attr("TopicId")
    $.ajax({
        url:"/Linksharing/subscription/save",
        data:{topicId:topicId},
        success:function(result){
            location.reload();
        }
    })

})

function toggleTopicEditName(uniqueIdForTopicEdit) {
    $("#topic-name-" + uniqueIdForTopicEdit).toggle();
    $("#topic-edit-" + uniqueIdForTopicEdit).toggle();
}

function setSeriousnessOnchangeEvent() {
    $(".seriousness").change(function (e) {
        e.preventDefault();
        $.ajax({
            url: "/Linksharing/subscription/update",
            data: {topicId: $(this).attr('topicId'), seriousnessString: $(this).val()},
            success: function (result) {

                console.log(result)
                location.reload();
            }
        })
    });
}
setSeriousnessOnchangeEvent();
function setVisibilityOnChangeEvent() {
    $(".visibility").change(function (e) {
        e.preventDefault();
        $.ajax({
            url: "/Linksharing/topic/changeVisibility",
            data: {topicId: $(this).attr('topicId'), visibilityString: $(this).val()},
            success: function (result) {
                console.log(result)
                location.reload();
            }
        })

    });
}
setVisibilityOnChangeEvent();




$("#deleteTopic").click(function(e){
    e.preventDefault();
    alert("hello");
//        var topicId=$(this).attr.("topicId")
//        $.ajax({
//            url:"Linksharing/topic/delete",
//            data:{topicId:topicId},
//            success:function(result){
//                location.reload()
//            }
//        })
})


function updateTopic(uniqueIdForTopicEdit) {
    var topicUpdatedName = $("#topic-name-edit-textbox-" + uniqueIdForTopicEdit).val();
    var topicName = $("#topic-name-" + uniqueIdForTopicEdit).text();
    var topicId = $("#topic-hidden-topic-id-" + uniqueIdForTopicEdit).val();
    $.ajax({
        url:"/Linksharing/topic/updateTopic",
        data:{topicUpdatedName:topicUpdatedName,topicName:topicName,topicId:topicId},
        success:function(result){
            location.reload();
        }
    })
}
