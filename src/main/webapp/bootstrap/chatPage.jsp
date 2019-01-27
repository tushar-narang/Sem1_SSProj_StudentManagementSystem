<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
      <title>Spring Boot WebSocket Chat Application</title>
      <script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
        <!-- Bootstrap CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script>    
	 var selectedTopic = 0;
	
	 $(document).ready(function() {
		
		$('#topic1').click(function(){
	    	
			selectedTopic =1;
			var commentsFor1 = [];
	    	document.getElementById('topicDesc').innerHTML = "bye";
	    	var api = api = "http://localhost:8080/student-management-system/webapi/student/getComments/1";
	    	
	    	var elmtTable = document.getElementById('commentsDislpay');
	    	var tableRows = elmtTable.getElementsByTagName('tr');
	    	var rowCount = tableRows.length;

	    	for (var x=rowCount-1; x>0; x--) {
	    	   elmtTable.removeChild(tableRows[x]);
	    	}
	    	
	    	$.get(api , function(data, status){
	    		//var table = document.getElementById("myTable");
	    		for(var i = 0; i < data.length; i++) 
	    		{
	    			if(commentsFor1.)
	    		var row = elmtTable.insertRow(i+1);
	    		var cell1 = row.insertCell(0);
	    		var cell2 = row.insertCell(1);
	    		var cell3 = row.insertCell(2);
	    		cell1.innerHTML =data[i].postedby;
	    		cell2.innerHTML = data[i].comment;
	    		cell3.innerHTML = data[i].timestamp;
	    		}
	    	});
	    }); 
		
		$('#topic2').click(function(){
	    	
			selectedTopic=2;
	    	document.getElementById('topicDesc').innerHTML = "bye2";
	    	var api = api = "http://localhost:8080/student-management-system/webapi/student/getComments/2";
	    	
	    	var elmtTable = document.getElementById('commentsDislpay');
	    	var tableRows = elmtTable.getElementsByTagName('tr');
	    	var rowCount = tableRows.length;

	    	for (var x=rowCount-1; x>0; x--) {
	    	   elmtTable.removeChild(tableRows[x]);
	    	}
	    	
	    	$.get(api , function(data, status){
	    		
	    	});
	    }); 
		
		
	 });
	 
	 function sendMessage() {
			alert("sending");
			
			var jersey_url = "http://localhost:8080/student-management-system/webapi/student/addComment";

			var formData = new FormData();

			formData.append('topicno',selectedTopic);
			formData.append('postedby',1);
			formData.append('comment',"bdhchdc ds");

			
			$.ajax({
				type: 'POST', // GET
				url: jersey_url,
				data: formData,
				cache : false,
				contentType : false,
				processData : false,
				error : function(jqXHR, textStatus, errorThrown) {
					//$("#messages").append("<li style='color: red;'>" + textStatus + " apa "+ errorThrown.responseText + "</li>");
				},
				success: function(data) {
					//$("#messages").append("<li style='color: red;'>" + textStatus + " apa "+ errorThrown.responseText + "</li>");
				}
			});
			
			
		}
	</script>
	
  </head>
  <body>
  
  	<div class="row">
		                                <div class="col-md-12" id="maindiv">
                                    <!-- Nav tabs --><div class="card">
                                    <ul class="nav nav-tabs" role="tablist" id="tabs">
                                  	 <li role="presentation"><a href="#addStudent" id="topic1" aria-controls="addStudent" role="tab" data-toggle="tab">Topic 1</a></li>
                     <li role="presentation"><a href="#view" id="topic2" aria-controls="view" role="tab" data-toggle="tab">Topic 2</a></li>
                     <li role="presentation"><a href="#search" id="topic3" aria-controls="search" role="tab" data-toggle="tab">Topic 3</a></li>
                     <li role="presentation"><a href="#filter" id="topic4" aria-controls="filter" role="tab" data-toggle="tab">Topic 4</a></li>
                                    </ul>

<div ><label id="topicDesc"></label></div>

<div><table id="commentsDislpay">
	<tr>
	<th> Posted By</th>
	<th> Comment</th>
	<th> PostedOn</th>
	</tr>
</table></div>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                    	
                                        <div role="tabpanel" class="tab-pane active" id="addStudent"></div>
                                        <div role="tabpanel" class="tab-pane" id="view"></div>
                                        <div role="tabpanel" class="tab-pane" id="search"></div>
                                        <div role="tabpanel" class="tab-pane" id="filter"></div>
                                    </div>
</div>
                                </div>
	</div>
  
  
  
  
  	<table>
  	<tr>
    <td><label>Enter Reciever:</label></td>
    <td><input type="text"></td>
    </tr>
    <tr>
    <td><label>Message</label></td>
    <td><input type="text"></td>
    </tr>
    <tr>
    <td colspan="2"><button type="button" onclick="sendMessage()">Send</button></td>
    </tr>
    </table>
  </body>
</html>