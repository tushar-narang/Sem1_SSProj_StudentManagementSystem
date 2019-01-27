<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
    
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
	    else if (x=='' || x > 100 || x<0 || x1=='' || x1 > 100 || x1 <0 || x2==''|| x2 > 100 || x2<0 ) {
	        alert("Range of marks should be between 0 and 100");
	        return false;
	    }
	    else {
	    	return true;
	    }	
	    
	}
	
	$('#addStudentImageSelect').change(function (e) {
	    
	    var oFReader = new FileReader();
	    oFReader.readAsDataURL(document.getElementById("addStudentImageSelect").files[0]);
	
	    oFReader.onload = function (oFREvent) {
	        document.getElementById("addStudentImage").src = oFREvent.target.result;
	    };
	});
	
	 $("#submit").click(function(e){
		          e.preventDefault();
		          console.log('clocked');
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

 </script>

<form id="addStudForm" name="addStudForm">
<div class="container"  id="addStudent" style="display: inline-block;">

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