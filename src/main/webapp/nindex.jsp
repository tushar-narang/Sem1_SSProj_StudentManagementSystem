

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
    

   
    

    
    
    $(document).ready(function(){
    	
    	$("#showAddStudent").click(function(){
	    	  $('#loadhere').load('AddStudent.jsp');
	      });
	      
	      $("#getStudentList").click(function(){
	    	  $('#loadhere').load('ViewList.jsp');
	      });
	      
	      $("#menu_searchStudentButton").click(function(){
	    	  $('#loadhere').load('SearchAndEdit.jsp');
	      });
	      
	      $("#rangeFilterButton").click(function(){
	    	  $('#loadhere').load('RangeSearch.jsp');
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
  
  <button type="button" class="button" id="menu_searchStudentButton">SEARCH</button>
												
  <button type="button" class="button" id="rangeFilterButton">FILTER</button>												
  
  <p></p>
  
  
</div>




<div id='loadhere'  style="display:block;">

</div>





<div class="container" style="display:none;" id="rangeResultdiv">

	<table style="text-align:center;">
		<tr>
		<td><label for="fname">From Roll No: &nbsp&nbsp&nbsp&nbsp&nbsp</label></td>
		<td><input type="text" id="searchStudentRollNo" name="searchrno"></td>
		</tr><tr>
		<td><label for="fname">To Roll No: &nbsp&nbsp&nbsp&nbsp&nbsp</label></td>
		<td><input type="text" id="searchStudentRollNo" name="searchrno"></td>
		</tr>
	</table>
	
	<button type="button" class="button" id="goHome2" style="margin-top: 10px">HOME</button>
	<button type="button" class="button" id="searchStudentButton" onclick="document.getElementById('filterStudentResult').style.display = 'inline-block';">SEARCH</button>
</div>

<div class="container" style="display:none;" id="filterStudentResult">

	
			
</div>



<!-- <div class="container" id="homeDiv">
<img src="homeImage.jpg" style="width:310px;height:215px;">
<br><br>
<label style="font-size: 30px">Welcome to SMS</label>
<br>
<label style="font-size: 15px">(Student Management System by Group 14)</label>
</div> -->
</body>
</html>