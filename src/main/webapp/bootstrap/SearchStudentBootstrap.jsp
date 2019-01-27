<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>

<script>
var editOrSubmit = 1;
function validateUpdateForm() {
	
    var x= document.getElementById('searchStudentPhysicsMarksEdit').value;
    var x1= document.getElementById('searchStudentChemistryMarksEdit').value;
    var x2= document.getElementById('searchStudentMathsMarksEdit').value;
   
   	if (x=='' || x > 100 || x<0 || x1=='' ||  x1 > 100 || x1 <0 || x2==''|| x2 > 100 || x2<0 ) {
        alert("Range of marks should be between 0 and 100");
        return false;
    }
    else {
    	return true;
    }	
    
}

$("#searchStudentQueryButton").click(function(){
	console.log("click");
    $.get("http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentRollNo").val(), function(data, status){
  	 	  $("#searchStudentResult").css('display', 'inline-block');
  	  	  console.log("pic url: " + data.imgarray );
  	  	  //document.getElementById("searchStudentImage").src = 'imageData/56.png';
  	      var ur = data.picUrl;
  	  	  document.getElementById("searchStudentImage").src = '' + ur;
  	  	  console.log(data);
  	  	  //document.getElementById("searchStudentImage").src = "data:image/png;base64,"+data.imgarray;
  	  	  document.getElementById("searchStudentNameText").innerHTML = "Student Name:";
      	  document.getElementById("searchStudentName").innerHTML = data.name;
      	  document.getElementById("searchStudentPhysicsMarks").innerHTML = data.marksPhysics;
      	  document.getElementById("searchStudentChemistryMarks").innerHTML = data.marksChemistry;
      	  document.getElementById("searchStudentMathsMarks").innerHTML = data.marksMaths;
      	  document.getElementById("searchStudentTotalMarks").innerHTML = (data.marksPhysics + data.marksChemistry + data.marksMaths);
      	  var perc = (data.marksPhysics + data.marksChemistry + data.marksMaths)/3;
      	  document.getElementById("searchStudentPercentageMarks").innerHTML = Math.round(perc * 100) / 100 ;
      	  document.getElementById("searchStudentGrade").innerHTML = data.grade;
      	  
      	  	$("#searchStudentPhysicsMarksEdit").css('display', 'none');
	    	  $("#searchStudentPhysicsMarks").css('display', 'block');
	    	  $("#searchStudentChemistryMarksEdit").css('display', 'none');
	    	  $("#searchStudentChemistryMarks").css('display', 'block');
	    	  $("#searchStudentMathsMarksEdit").css('display', 'none');
	    	  $("#searchStudentMathsMarks").css('display', 'block');
	    	  $("#searchStudentImage").css('display', 'block');
	    	  $("#searchStudentEditButton").css('display', 'inline-block');
    }).fail(function(data, textStatus, xhr) {
  	  document.getElementById("searchStudentNameText").innerHTML = "";
  	  document.getElementById("searchStudentName").innerHTML = "No data Found"; 
  	  $("#searchStudentMarksFieldSet").css('display', 'none');
  	  $("#searchStudentImage").css('display', 'none');
  	  $("#searchStudentEditButton").css('display', 'none');
      });
	});


$("#searchStudentEditButton").click(function(){
	  
	  console.log(editOrSubmit + " rrrrr");
	  
	  if(editOrSubmit %2 == 1){
  	 $.get("http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentRollNo").val(), function(data, status){
	        	$("#searchStudentMarksFieldSet").css('display', 'inline-block');
	    	  	$("#searchStudentPhysicsMarksEdit").css('display', 'block');
	    	  	
	    	  	$("#searchStudentPhysicsMarksEdit").val(data.marksPhysics);
	    	  	$("#searchStudentPhysicsMarks").css('display', 'none');
	    	  	$("#searchStudentChemistryMarksEdit").css('display', 'block');
	    	  	$("#searchStudentChemistryMarksEdit").val(data.marksChemistry);
	    	  	$("#searchStudentChemistryMarks").css('display', 'none');
	    	  	$("#searchStudentMathsMarksEdit").css('display', 'block');
	    	  	$("#searchStudentMathsMarksEdit").val(data.marksMaths);
	    	  	$("#searchStudentMathsMarks").css('display', 'none');
	  	});
  	document.getElementById("searchStudentEditButton").innerHTML ="SAVE";
  	editOrSubmit++;
	  }
	  else
		  {
		  
		  		if(validateUpdateForm()){
		    		  document.getElementById("searchStudentEditButton").innerHTML ="EDIT";
		    		  var studName = document.getElementById('searchStudentName').textContent;
		    		  
		    		  $.ajax({
		    			  type: "PUT",
		 	        	  contentType: "application/json",
		 	                url: "http://localhost:8080/student-management-system/webapi/student/editStudent",
		 	                data: JSON.stringify({ "name" : studName  , "rno" : $("#searchStudentRollNo").val() ,  "marksPhysics" : $("#searchStudentPhysicsMarksEdit").val() ,  "marksChemistry" : $("#searchStudentChemistryMarksEdit").val() , "marksMaths" : $("#searchStudentMathsMarksEdit").val() }),
		 	                
		 	               success:function(data){
		 	         			console.log( data.marksPhysics + " result"); 
		 	         			$("#searchStudentMarksFieldSet").css('display', 'inline-block');
					    	  	$("#searchStudentPhysicsMarksEdit").css('display', 'none');
					    	  	document.getElementById("searchStudentPhysicsMarks").innerHTML = data.marksPhysics;
					    	  	$("#searchStudentPhysicsMarks").css('display', 'block');
					    	  	$("#searchStudentChemistryMarksEdit").css('display', 'none');
					    	  	document.getElementById("searchStudentChemistryMarks").innerHTML = data.marksChemistry;
					    	  	$("#searchStudentChemistryMarks").css('display', 'block');
					    	  	$("#searchStudentMathsMarksEdit").css('display', 'none');
					    	  	document.getElementById("searchStudentMathsMarks").innerHTML = data.marksMaths;
					    	  	$("#searchStudentMathsMarks").css('display', 'block');
					    	  	 document.getElementById("searchStudentTotalMarks").innerHTML = (data.marksPhysics + data.marksChemistry + data.marksMaths);
					    	  	  var perc = (data.marksPhysics + data.marksChemistry + data.marksMaths)/3;
					        	  document.getElementById("searchStudentPercentageMarks").innerHTML = Math.round(perc * 100) / 100 ;
					    	  	 document.getElementById("searchStudentGrade").innerHTML = data.grade;
		 	        }}); 
		    		  
		    		  editOrSubmit++;
		    	}
		  }
});
</script>

<div class="container">
  <div class="row">
  
    <div class="col-sm-5"  id="searchStudent" >

		<div class="container"  id="searchStudent">
		
			
				<div class="row">
				<div class="col-sm-2" ><label for="fname">&nbsp&nbsp&nbsp Roll No: &nbsp&nbsp&nbsp&nbsp&nbsp</label></div>
				<div class="col-sm-2" ><input type="text" id="searchStudentRollNo" name="searchrno"></div>
				</div>
		
			
			<!-- <button type="button" class="button" id="goHome2" style="margin-top: 10px">HOME</button> -->
			<button type="button" class="btn btn-primary" id="searchStudentQueryButton" onclick="document.getElementById('searchStudentResult').style.display = 'inline-block'">SEARCH</button>
		</div>
		
		
	</div>
    <div class="col-sm-3" >
    
    
    <div class="container"  id="searchStudentResult" style="display: none">

	
		<div class="row">
		
		<div class="col-sm-2"  style=" display: block;"><label id="searchStudentNameText">Student Name: </label></div>
		
		<div class="col-sm-1"  style="display: block"><label id="searchStudentName" >sjdh</label></div>
		<div class="col-sm-1" ><img src="defaultpic.jpeg" style="width:110px;height:110px;margin-left: 140px;display:none" id="searchStudentImage"></div>
		</div>
	
	
	<fieldset id="searchStudentMarksFieldSet" class="innercontainer">
	<legend>Marks</legend>
		<div class="container">
			<div class="row">
			<div class="col-sm-1" ><label for="physics">Physics</label></div>
			<div class="col-sm-1"><label id="searchStudentPhysicsMarks"></label>
				<input type="text" style="display:none;" id="searchStudentPhysicsMarksEdit"></div>
			</div>
			<div class="row">
			<div class="col-sm-1"><label for="chemistry">Chemistry</label></div>
			<div class="col-sm-1"><label id="searchStudentChemistryMarks"></label>
				<input type="text" style="display:none;" id="searchStudentChemistryMarksEdit"></div>
			</div>
			<div class="row">
			<div class="col-sm-1"><label for="maths">Maths</label></div>
			<div class="col-sm-1"><label id="searchStudentMathsMarks"></label>
				<input type="text" style="display:none;" id="searchStudentMathsMarksEdit"></div>
			</div>
			
		
		</div>
	
			
			<label for="maths">Total:</label>
			<label id="searchStudentTotalMarks">240</label>
			&nbsp
			<label for="maths">Percentage:</label>
			<label id="searchStudentPercentageMarks">80</label>
			&nbsp
			<label for="maths">Grade:</label>
			<label id="searchStudentGrade">80</label>
			
	</fieldset>
	<button type="button" class="btn btn-primary" id="searchStudentEditButton" style="display:none;">EDIT</button>
</div>
    
    </div>
  </div>
</div>


<br>
