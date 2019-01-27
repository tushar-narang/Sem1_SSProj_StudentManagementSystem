<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<script>
$(document).ready(function(){
	console.log('ready');
	
	 $("#Adminsubmit").click(function(e){
         e.preventDefault();
         console.log('clocked');
         var form = $('#addadminForm')[0];
 		// Create an FormData object 
         var data = new FormData(form);
 		
 		
		        $.ajax({type: "POST",
		        		enctype: 'multipart/form-data',
		        	 //contentType: "application/json",
		                url: "http://localhost:8080/student-management-system/webapi/student/addAdmin",
		               // data: JSON.stringify({ "name" : $("#addStud_name").val() , "rno" : $("#addStud_rno").val() ,  "marksPhysics" : $("#addStud_marksPhysics").val() ,  "marksChemistry" : $("#addStud_marksChemistry").val() , "marksMaths" : $("#addStud_marksMaths").val() }),
		               data: data, 
		               processData: false,
		                contentType: false,
		                cache: false,
		                timeout: 600000,
		                //dataType: 'json', 
		               //data: JSON.stringify({ "name" : "abc" , "rno" :"12a" ,  "marksPhysics" : 12 ,  "marksChemistry" :2 , "marksMaths" : 12 }),
		 
		                success:function(result){
		         // $("#sharelink").html(result);
		                	window.alert(result);
		                	if(result == "Record saved")
		                		{
		                		document.getElementById('addStudent').style.display = 'none'
		                		}
		        }}); 
		        
         
	 });
	
	
});

</script>

<div class="form-group col" id="addAdmin">
<form id="addadminForm" name="addadminForm">

	<div class="row"><div class="col-sm-7"></div></div>
	<div class="row">
	<div class="col-sm-6">
	<input type="text" id="addAdmin_name" name="addAdminName" class="form-control" placeholder="Your name..">
	</div>
	<div class="col-sm-6">
	<input type="text" id="addAdmin_rno" name="addAdminPassword" class="form-control" placeholder="Password..">
	</div>
	</div>
	<div class="col-sm-3 text-center"><button type="button" class="btn btn-primary" id="Adminsubmit">SUBMIT</button></div>
	</form>
</div>