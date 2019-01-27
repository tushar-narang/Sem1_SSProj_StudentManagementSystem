
<!DOCTYPE html>
<html>
<head>
<style>
.topdiv {
    text-align: center;
	border-radius: 15px;
	background-color: #f2f2f2;
	padding: 2px;
	margin-left: 50px;
	margin-right: 50px;
}
.heading {
	color: #121212;
	font-size: 20px;
}
.button {
width: 200px;
    background-color: #0000ff; /* Green */
    border: none;
    color: white;
	border-radius: 10px;
    padding: 10px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

.container {
	width: 600px;
	margin: 10px;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 10px;
	display: inline-block;
}

.innercontainer {
	width: 400px;
	margin: 10px;
	border: 1px solid #0000ff;
    border-radius: 5px;
    padding: 10px;
	display: inline-block;
}

function showDiv() {
   document.getElementById('welcomeDiv').style.display = "block";
}

</style>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
    

    function validateForm() {
    	
        var x= document.getElementById('addStud_marksPhysics').value;
        var x1= document.getElementById('addStud_marksChemistry').value;
        var x2= document.getElementById('addStud_marksMaths').value;
        //Name and roll no validations
        var name= document.getElementById('addStud_name').value;
        var roll_no= document.getElementById('addStud_rno').value;
        
        if(name ==''){
        	alert("Name cannot  be blank");
            return false;
        }
        else if(roll_no==''){
        	alert("Roll_no cannot  be blank");
            return false;
        }
        else if (x=='' || x > 100 || x<0 || x1=='' ||  x1 > 100 || x1 <0 || x2==''|| x2 > 100 || x2<0 ) {
            alert("Range of marks should be between 0 and 100");
            return false;
        }
        else {
        	return true;
        }	
        
    }
    
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
    
    
    $(document).ready(function(){
    	var editOrSubmit = 1;
    	
    	
	       $("#submit").click(function(e){
	          e.preventDefault();
	          if (validateForm()){
	          var form = $('#addStudForm')[0];
	  		// Create an FormData object 
	          var data = new FormData(form);
			        $.ajax({type: "POST",
			        		enctype: 'multipart/form-data',
			        	 //contentType: "application/json",
			                url: "http://localhost:8080/student-management-system/webapi/student/addStuds",
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
			        
			        
	        
	        
	      }}); 
	      
	      $("#getStudentList").click(function(){
	    	  
	    	  	document.getElementById('addStudent').style.display = 'none';
				document.getElementById('viewList').style.display = 'inline-block';
				document.getElementById('searchStudent').style.display = 'none';
				document.getElementById('searchStudentResult').style.display = 'none';
				document.getElementById('homeDiv').style.display = 'none';
				
	          $.get("http://localhost:8080/student-management-system/webapi/student/list", function(data, status){
	              //alert("Data: " + data + "\nStatus: " + status);
	               var table = document.getElementById("listTable");
	               var tableHeaderRowCount = 2;
	
	               var rowCount = table.rows.length;
	               //console.log(rowCount + " count");
	               for (var i = tableHeaderRowCount; i < rowCount; i++) {
	                   table.deleteRow(tableHeaderRowCount);
	               }
	              for(var prop in data) {
	            	    var item = data[prop];
	            	    //console.log(item);
	            	    
	            	   
	            	    
	            	 	var row = table.insertRow(-1);
	            	 	
	            		var cell1 = row.insertCell(0);
	            	 	var cell2 = row.insertCell(1);
	            	 	var cell3 = row.insertCell(2);
	            	 	var cell4 = row.insertCell(3);
	            	 	var cell5 = row.insertCell(4);
	
	            	 // Add some text to the new cells:
	            	 	cell1.innerHTML = item.rno;
	            	 	cell2.innerHTML = item.name;
	            	 	cell3.innerHTML = item.marksPhysics;
	            	 	cell4.innerHTML = item.marksChemistry;
	            	 	cell5.innerHTML = item.marksMaths;
	              }
	          });
    	});
      
	      $("#searchStudentButton").click(function(){
	          $.get("http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentRollNo").val(), function(data, status){
	        	  $("#searchStudentMarksFieldSet").css('display', 'inline-block');
	        	  	  console.log("pic url: " + data.imgarray );
	        	  	  //document.getElementById("searchStudentImage").src = 'imageData/56.png';
	        	      //var ur = data.picUrl;
	        	  	  //document.getElementById("searchStudentImage").src = '' + ur;
	        	  	  console.log(data);
	        	  	  document.getElementById("searchStudentImage").src = "data:image/png;base64,"+data.imgarray;
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
	      
	      
	      $('#addStudentImageSelect').change(function (e) {
	    	    
	    	    var oFReader = new FileReader();
	            oFReader.readAsDataURL(document.getElementById("addStudentImageSelect").files[0]);

	            oFReader.onload = function (oFREvent) {
	                document.getElementById("addStudentImage").src = oFREvent.target.result;
	            };
	    	});
	      
	      
	      $("#showAddStudent").click(function(){
	    	  	document.getElementById('addStudent').style.display = 'inline-block';
				document.getElementById('viewList').style.display = 'none';
				document.getElementById('searchStudent').style.display = 'none';
				document.getElementById('searchStudentResult').style.display = 'none';
				document.getElementById('homeDiv').style.display = 'none';
				
				var container = document.getElementById('addStudent');
			    var inputs = container.getElementsByTagName('input');
			    for (var index = 0; index < inputs.length; ++index) {
			        inputs[index].value = '';
			    }
			    document.getElementById("addStudentImage").src = 'defaultpic.jpeg';
	      });
	      
	      
	      $("#goHome").click(function(){
	    	    document.getElementById('addStudent').style.display = 'none';
				document.getElementById('viewList').style.display = 'none';
				document.getElementById('searchStudent').style.display = 'none';
				document.getElementById('searchStudentResult').style.display = 'none';
				document.getElementById('homeDiv').style.display = 'inline-block';
	      });
	      
	      $("#goHome1").click(function(){
	    	    document.getElementById('addStudent').style.display = 'none';
				document.getElementById('viewList').style.display = 'none';
				document.getElementById('searchStudent').style.display = 'none';
				document.getElementById('searchStudentResult').style.display = 'none';
				document.getElementById('homeDiv').style.display = 'inline-block';
	      });
	      
	      $("#goHome2").click(function(){
	    	    document.getElementById('addStudent').style.display = 'none';
				document.getElementById('viewList').style.display = 'none';
				document.getElementById('searchStudent').style.display = 'none';
				document.getElementById('searchStudentResult').style.display = 'none';
				document.getElementById('homeDiv').style.display = 'inline-block';
	      });
	      
    });
    
    
    
    </script>


<title>Page Title</title>
</head>
<body style="text-align: center; background-color:#121212;">

<div class="topdiv">
  
  <p class="heading"> Student Management System(SMS) </p>
  
  <button type="button" class="button" id="showAddStudent" >ADD STUDENT</button>
  
  <button type="button" class="button" id= "getStudentList">VIEW LIST</button>
  
  <button type="button" class="button" onclick="document.getElementById('addStudent').style.display = 'none';
												document.getElementById('viewList').style.display = 'none';
												document.getElementById('searchStudent').style.display = 'inline-block';
												document.getElementById('searchStudentResult').style.display = 'none';
												document.getElementById('homeDiv').style.display = 'none';
												">FILTER</button>
  
  <p></p>
  
  
</div>

<form id="addStudForm" name="addStudForm">
<div class="container" style="display:none;" id="addStudent">

	<table style="text-align:center;display:inline-block;">
		<tr>
		<td><label for="fname">Name</label></td>
		<td><input type="text" id="addStud_name" name="addName" placeholder="Your name.."><br></td>
		<td rowspan="2"><img src="defaultpic.jpeg" style="width:110px;height:110px;" id="addStudentImage"></td>
		</tr>
		
		<tr>
		<td><label for="rno">Roll No</label></td>
		<td><input type="text" id="addStud_rno" name="addRollno" placeholder="Roll No.."><br></td>
		</tr>
		
		<tr>
		<td></td><td></td>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="file" id="addStudentImageSelect" name="addImageSelect"></td>
		</tr>
	</table>

	<fieldset class="innercontainer">
	<legend> Enter Marks</legend>
		<table>
			<tr>
			<td ><label for="physics">Physics</label></td>
			<td><input type="text" id="addStud_marksPhysics" name="addPhysicsMarks"></td>
			</tr>
			<tr>
			<td><label for="chemistry">Chemistry</label></td>
			<td><input type="text" id="addStud_marksChemistry" name="addChemistryMarks"></td>
			</tr>
			<tr>
			<td><label for="maths">Maths</label></td>
			<td><input type="text" id="addStud_marksMaths" name="addMathsMarks"></td>
			</tr>
		
	</table></fieldset>
    
    <button type="button" class="button" id="goHome">HOME</button>
    <button type="button" class="button" id="submit">SUBMIT</button>
 
</div>
</form>

<div class="container" style="display:none;" id="viewList">
	<table style="width:100%; " id="listTable">
		<tr>
		<th><label for="fname">Roll No</label></th>
		<th><label for="fname">Name</label></th>
		<th colspan="3">Marks</th>
		</tr>
		
		<tr>
		<th></th>
		<th></th>
		<th>Physics</th>
		<th>Chemistry</th>
		<th>Maths</th>
		</tr>
		
		
	</table>
	
	<button type="button" class="button" id="goHome1" style="margin-top: 20px">HOME</button>
</div>

<div class="container" style="display:none;" id="searchStudent">

	<table style="text-align:center;">
		<tr>
		<td><label for="fname">&nbsp&nbsp&nbsp Roll No: &nbsp&nbsp&nbsp&nbsp&nbsp</label></td>
		<td><input type="text" id="searchStudentRollNo" name="searchrno"></td>
		</tr>
	</table>
	
	<button type="button" class="button" id="goHome2" style="margin-top: 10px">HOME</button>
	<button type="button" class="button" id="searchStudentButton" onclick="document.getElementById('searchStudentResult').style.display = 'inline-block'">SEARCH</button>
</div>
<br>
<div class="container" style="display:none;" id="searchStudentResult">

	<table style="margin-left: 90px" >
		<tr>
		
		<td style=" display: block; margin-top: 30px"><label id="searchStudentNameText">Student Name: </label></td>
		<td></td>
		<td style="display: block"><label id="searchStudentName" >sjdh</label></td>
		<td><img src="defaultpic.jpeg" style="width:110px;height:110px;margin-left: 140px;display:none" id="searchStudentImage"></td>
		</tr>
	</table>
	
	<fieldset id="searchStudentMarksFieldSet" class="innercontainer">
	<legend>Marks</legend>
		<table>
			<tr>
			<td ><label for="physics">Physics</label></td>
			<td><label id="searchStudentPhysicsMarks"></label>
				<input type="text" style="display:none;" id="searchStudentPhysicsMarksEdit"></td>
			</tr>
			<tr>
			<td><label for="chemistry">Chemistry</label></td>
			<td><label id="searchStudentChemistryMarks"></label>
				<input type="text" style="display:none;" id="searchStudentChemistryMarksEdit"></td>
			</tr>
			<tr>
			<td><label for="maths">Maths</label></td>
			<td><label id="searchStudentMathsMarks"></label>
				<input type="text" style="display:none;" id="searchStudentMathsMarksEdit"></td>
			</tr>
			<td><br></td>
			
		
	</table>
	
			
			<label for="maths">Total:</label>
			<label id="searchStudentTotalMarks">240</label>
			&nbsp
			<label for="maths">Percentage:</label>
			<label id="searchStudentPercentageMarks">80</label>
			&nbsp
			<label for="maths">Grade:</label>
			<label id="searchStudentGrade">80</label>
			
	</fieldset>
	<button type="button" class="button" id="searchStudentEditButton" style="display:none;">EDIT</button>
</div>

<div class="container" id="homeDiv">
<img src="homeImage.jpg" style="width:310px;height:215px;">
<br><br>
<label style="font-size: 30px">Welcome to SMS</label>
<br>
<label style="font-size: 15px">(Student Management System by Group 14)</label>
</div>
</body>
</html>