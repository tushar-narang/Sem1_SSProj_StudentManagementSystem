<script>
$("#filterStudentQueryButton").click(function(){
	
	/* var myNode = document.getElementById("carouselList");
	 while (myNode.firstChild) {
	    myNode.removeChild(myNode.firstChild);
	} */
	 $('#carouselList').empty();
	 var myNode2 = document.getElementById("carouselAddArea");
	 while (myNode2.firstChild) {
	    myNode2.removeChild(myNode2.firstChild);
	}
	 
	var e = document.getElementById("filterby");
	var filter = e.options[e.selectedIndex].value;
	console.log(filter + "selected");
	var api;
	if(filter == 'none')
		api = "http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentFromRollNo").val() + "/" + $("#searchStudentToRollNo").val();
	else if(filter == 'grade')
		api = "http://localhost:8080/student-management-system/webapi/student/getStudentByGradeOrder/" + $("#searchStudentFromRollNo").val() + "/" + $("#searchStudentToRollNo").val();	
	else
		api = "http://localhost:8080/student-management-system/webapi/student/getStudent/" + $("#searchStudentFromRollNo").val() + "/" + $("#searchStudentToRollNo").val() + "/orderBy=" + filter;
   console.log(api);
	$.get(api , function(data, status){
    
    	for(i=0;i< data.length;i++)
    		{
    		console.log(data[i].rno + " " + data[i].name);
    		
    		if(i==0){
	    		 $('#carouselList').append(
	    				 '<li data-target="#myCarousel'+ i +'" data-slide-to="' + i +'" class="active"></li>'
	    		);
	    		 $('#carouselAddArea').append(
	    				 '<div class="item active">' +
	    			      	'<img src="' + data[i].picUrl + '" alt="Chicago">' +
	    			      	'<label>Roll No: ' + data[i].rno + '</label><br>' + 
	    			      	'<label>Name: ' + data[i].name + '</label><br><br>' + 
	    			      	'<label>Physics: ' + data[i].marksPhysics + '</label><br>' + 
	    			      	'<label>Chemistry: ' + data[i].marksChemistry + '</label><br>' + 
	    			      	'<label>Maths: ' + data[i].marksMaths + '</label><br>' + 
	    			      	'<label>Grade: ' + data[i].grade + '</label>' + 
	    			    '</div>'
	    		);
    		}
    		else{
    			 $('#carouselList').append(
	    				 '<li data-target="#myCarousel'+ i +'" data-slide-to="' + i +'"></li>'
	    		);
    			 $('#carouselAddArea').append(
        				 '<div class="item">' +
        			      	'<img src="' + data[i].picUrl + '" alt="Chicago">' +
        			      	'<label>Roll No: ' + data[i].rno + '</label><br>' + 
        			      	'<label>Name: ' + data[i].name + '</label><br><br>' + 
        			      	'<label>Physics: ' + data[i].marksPhysics + '</label><br>' + 
	    			      	'<label>Chemistry: ' + data[i].marksChemistry + '</label><br>' + 
	    			      	'<label>Maths: ' + data[i].marksMaths + '</label><br>' + 
	    			      	'<label>Grade: ' + data[i].grade + '</label>' + 
        			    '</div>'
        		);
    		}
    		
    		 
    		/*  $('#searchStudentResult').append(
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
    				); */
    		
    		}
    });
});
    	</script>

<div class="container">

  <div class="row">
   

		<div class="col-sm-6"  id="searchStudent" >
		
			<div class="container">
				<div class="row">
					<div class="col-sm-1" ><label for="fname">From Roll No</label></div>
					<div class="col-sm-4" ><input type="text" id="searchStudentFromRollNo" name="searchrno"></div>	
				</div>
				<div class="row">
					<div class="col-sm-1" ><label for="fname">To Roll No</label></div>
					<div class="col-sm-4" ><input type="text" id="searchStudentToRollNo" name="searchrno"></div>
				</div>
				<div class="row">
					<div class="col-sm-1" ><label for="fname">Order by:</label></div>
					<div class="col-sm-4" >
						<select id="filterby">
						  <option disabled selected value="none"> -- None -- </option>
						  <option value="rno">Roll No</option>
						  <option value="name">Name</option>
						  <option value="marksPhysics">Physics Marks</option>
						  <option value="marksChemistry">Chemistry Marks</option>
						  <option value="marksMaths">Maths Marks</option>
						  <option value="grade">Grade</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-7" >
						<br><!-- <button type="button" class="button" id="goHome2" style="margin-top: 10px">HOME</button> -->
						<button type="button" class="btn btn-primary" id="filterStudentQueryButton">SEARCH</button>
					</div>
				</div>
			</div>
			
			
		</div>
	
	
	
  
    <div class="col-sm-3">
	    <div id="myCarousel" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators" id="carouselList">
			    <!-- <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" id="carouselAddArea">
				    <!-- <div class="item active">
				      <img src="defaultpic.jpeg" alt="Los Angeles">
				    </div> -->
			  </div>
			
			  <!-- Left and right controls -->
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#myCarousel" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right"></span>
			    <span class="sr-only">Next</span>
			  </a>
		</div>
	</div>
	</div>	
</div>


<br>