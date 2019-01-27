<script>
$("#searchStudentButton").click(function(){
	
	var myNode = document.getElementById("searchStudentResult");
	while (myNode.firstChild) {
	    myNode.removeChild(myNode.firstChild);
	}
	$("#searchStudentResult").css('display', 'inline-block');
	
	var e = document.getElementById("filterby");
	var filter = e.options[e.selectedIndex].value;
	console.log(filter + "selected");
	var api;
	if(filter == 'none')
		api = "http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentFromRollNo").val() + "/" + $("#searchStudentToRollNo").val();
	else
		api = "http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentFromRollNo").val() + "/" + $("#searchStudentToRollNo").val() + "/orderBy=" + filter;
   console.log(api);
	$.get(api , function(data, status){
    
    	for(i=0;i< data.length;i++)
    		{
    		console.log(data[i].rno + " " + data[i].name);
    		 $('#searchStudentResult').append(
    				 '<div style="background-color:  #f2f2f2; margin-bottom:20px">' +
    					'<table>' +
    						'<tr>' +
    							'<td rowspan="5">' +
    								'<img src="' + data[i].picUrl + '" style="width:110px;height:110px;margin-right: 30px">' +
    							'</td>' +
    							'<td>' +
    								'<label>&nbsp Name:</label>' + data[i].name +
    							'</td>' +
    						'</tr>' +
    						'<tr>' + 
	    						'<td>' +
									'<label>Roll No:</label>' + data[i].rno +
								'</td>' +
    						'</tr>' +
    						'<tr>' + 
	    						'<td>' +
									'<label>Physics:</label>' + data[i].marksPhysics +
								'</td>' +
							'</tr>' +
							'<tr>' + 
	    						'<td>' +
									'<label>&nbsp&nbsp Chemistry:</label>' + data[i].marksChemistry +
								'</td>' +
							'</tr>' +
							'<tr>' + 
	    						'<td>' +
									'<label>Maths:</label>' + data[i].marksMaths +
								'</td>' +
							'</tr>' +
    					'</table>' +
    				'</div>'
    				);
    		
    		}
    });
});
    	</script>

<table>
  <tr>
    <td valign="top">

		<div class="container"  id="searchStudent" style="width: 400px; margin-left: 150px">
		
			<table style="text-align:center;">
				<tr>
				<td><label for="fname">From Roll No: &nbsp&nbsp&nbsp&nbsp&nbsp</label></td>
				<td><input type="text" id="searchStudentFromRollNo" name="searchrno"></td>
				</tr><tr>
				<td><label for="fname">To Roll No: &nbsp&nbsp&nbsp&nbsp&nbsp</label></td>
				<td><input type="text" id="searchStudentToRollNo" name="searchrno"></td>
				</tr>
				<tr>
				<td>Order by:</td>
				<td>
					<select id="filterby">
					  <option disabled selected value="none"> -- None -- </option>
					  <option value="rno">Roll No</option>
					  <option value="name">Name</option>
					  <option value="marksPhysics">Physics Marks</option>
					  <option value="marksChemistry">Chemistry Marks</option>
					  <option value="marksMaths">Maths Marks</option>
					</select></td>
				</tr>
			</table>
			
			<!-- <button type="button" class="button" id="goHome2" style="margin-top: 10px">HOME</button> -->
			<button type="button" class="button" id="searchStudentButton" onclick="document.getElementById('searchStudentResult').style.display = 'inline-block'">SEARCH</button>
		</div>
		
		
	</td>
    <td>
    
    
    <div class="container"  id="searchStudentResult" style="display: none">

	</div>
    
    </td>
  </tr>
</table>


<br>