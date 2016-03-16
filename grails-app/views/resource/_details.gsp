
<div style="margin: 10px">
    <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
             <div class="col-sm-2">
                 <span class="glyphicon glyphicon-user" style="font-size:90px; border:1px solid"></span>
             </div>
             <div class="col-sm-10">
                 <div class="col-sm-8">
                        <h4>${resource.createdBy}</h4>
                 </div>
                 <div class="col-sm-4">
                        <g:link>${resource.topic}</g:link>
                 </div>
             </div>
              <div class="row">
                  <div class="col-sm-offset-4">
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
                <ls:canDeleteResource resourceId="${resource?.id}"></ls:canDeleteResource>
            </div>
            <div class="col-sm-2">
                <ls:canUpdateResource resourceId="${resource?.id}"></ls:canUpdateResource>
            </div>
        </div>
        </div>
</div>
</div>







