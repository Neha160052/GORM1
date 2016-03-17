
<div style="margin: 10px">
    <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
             <div class="col-sm-2">
                 <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
             </div>
             <div class="col-sm-10">
                 <div class="col-sm-10">
                        <h4>${resource.createdBy}</h4>
                 </div>
                 <div class="col-sm-2">
                     <g:link controller="topic" action="show" params="[topicId:resource.topic?.id]"><u>${resource.topic}</u></g:link>
                        %{--<g:link>${resource.topic}</g:link>--}%
                 </div>
             </div>
              <div class="row">
                  <div class="col-sm-offset-6">
                      <span>score ${resource.ratingInfo.totalScore}</span>
                      <span>votes ${resource.ratingInfo.totalVotes}</span>
                  </div>

              </div>

              <div class="row">
                  <div class="col-sm-offset-8">
                      <g:select name="rating" from="[1,2,3,4,5]" class="rating" resourceId="${resource?.id}"></g:select>
                  </div>
              </div>
              <div class="row">
                  <div class="col-sm-offset-3">
                     <p>${resource.discription}</p>
                  </div>
              </div>
           </div>
        <div class="row">
            <div class=" col-sm-offset-2 col-sm-3">
                <span>
                    <i class="fa fa-facebook-official" ></i>
                    <i class="fa fa-tumblr"></i>
                    <i class="fa fa-google-plus"></i>
                </span>
            </div>
            <div class="col-sm-2">
                <ls:resourceType resourceId="${resource.id}"/>
            </div>
            <div class="col-sm-2">
                <ls:canDeleteResource resourceId="${resource?.id}">
                    <g:link controller="resource" action="delete" class="deleteResource" params="[resourceId:resource?.id]"><u>Delete</u></g:link>
                </ls:canDeleteResource>
            </div>
            <div class="col-sm-2">
                <ls:canDeleteResource resourceId="${resource?.id}">
                    <ls:isLinkResource resourceId="${resource?.id}">
                        <div class="span4 proj-div" data-toggle="modal" data-target="#slModal">Update</div>
                        <div id="slModal" class="modal fade">
                            <g:render template="/linkResource/update" model="[resource:resource]"/>
                        </div>
                    </ls:isLinkResource>
                    <ls:isDocumentResource resourceId="${resource?.id}">
                    <div class="span4 proj-div" data-toggle="modal" data-target="#sdModal" style="color:#3278b3">Update</div>
                    <div id="sdModal" class="modal fade">
                        <g:render template="/documentResource/update" model="[resource:resource]"/>
                    </div>
                    </ls:isDocumentResource>
                </ls:canDeleteResource>
                %{--<ls:canUpdateResource resourceId="${resource?.id}"></ls:canUpdateResource>--}%
            </div>
        </div>
        </div>
</div>
</div>
<script>
    $('.rating').change(function(e){
        e.preventDefault();
        var resourceId=$(this).attr("resourceId");
        var rate=$(this).val();
        $.ajax({
            url:"/Linksharing/resource/rating",
            data:{resourceId:resourceId,rate:rate},
            success: function (result) {

            console.log(result)
            location.reload();
        }
        })
    });
</script>






