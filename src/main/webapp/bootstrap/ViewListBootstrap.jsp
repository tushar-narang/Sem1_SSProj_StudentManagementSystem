<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<script>
$(document).ready(function(){
	  
  	/* document.getElementById('addStudent').style.display = 'none';
	document.getElementById('viewList').style.display = 'inline-block';
	document.getElementById('searchStudent').style.display = 'none';
	document.getElementById('searchStudentResult').style.display = 'none';
	document.getElementById('homeDiv').style.display = 'none'; */
	
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

</script>
<div class="container"  id="viewList">
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
