
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="index.css" />
    <title>SMS</title>
  </head>
  <body>
   <!--  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <button class="btn btn-danger navbar-btn">Student Management</button>
    </div>
    
  </div>
</nav> -->
<h3><p style="text-align: center;">Student Management System</p></h3>
<div class="container" id="loginDiv">
<label id="loginRNoLabel">UserName</label><br>
<input type="text" id="loginRNo"><br><br>
<label id="loginPasswordLabel">Password:</label><br>
<input type="password" id="loginPassword">
<br>
</div>
<br><button type="button" id="loginClick" class="btn btn-primary" style="margin-left: 110px;">Login</button>
    <div class="container">
	
	<div class="row">
		                                <div class="col-md-12" id="maindiv" style="display: none">
                                    <!-- Nav tabs --><div class="card">
                                    <ul class="nav nav-tabs" role="tablist" id="tabs">
                                  	 <li role="presentation"><a href="#addStudent" id="addStudentButton" aria-controls="addStudent" role="tab" data-toggle="tab">Add Student</a></li>
                     <li role="presentation"><a href="#view" id="viewListButton" aria-controls="view" role="tab" data-toggle="tab">View List</a></li>
                     <li role="presentation"><a href="#search" id="searchStudentButton" aria-controls="search" role="tab" data-toggle="tab">Search</a></li>
                     <li role="presentation"><a href="#filter" id="filterButton" aria-controls="filter" role="tab" data-toggle="tab">Filter</a></li>
                     <li role="presentation"><a href="#filter" id="chatButton" aria-controls="filter" role="tab" data-toggle="tab">Chat</a></li>
                     <li role="presentation"><a href="#newadmin" id="addAdminButton" aria-controls="Admin" role="tab" data-toggle="tab">Add Admin User</a></li>
                                 </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                    	
                                        <div role="tabpanel" class="tab-pane active" id="addStudent"></div>
                                        <div role="tabpanel" class="tab-pane" id="view"></div>
                                        <div role="tabpanel" class="tab-pane" id="search"></div>
                                        <div role="tabpanel" class="tab-pane" id="filter"></div>
                                        <div role="tabpanel" class="tab-pane" id="newadmin"></div>
                                    </div>
</div>
                                </div>
	</div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    
    <script type="text/javascript">
    $(document).ready(function() {
    	var loginOrLogout = 1;
       // $('#login').load('bootstrap/LoginBootstrap.jsp');
       //$("#maindiv").removeClass('col-md-12-none');
       //$("#maindiv").toggle();
        $('#loginClick').click(function(){
        	
        	//$("#maindiv").toggle();
        	
        	$('#tabs').append(
        			/*  '<li role="presentation"><a href="#addStudent" id="addStudentButton" aria-controls="addStudent" role="tab" data-toggle="tab">Add Student</a></li>' +
                     '<li role="presentation"><a href="#view" id="viewListButton" aria-controls="view" role="tab" data-toggle="tab">View List</a></li>'+
                     '<li role="presentation"><a href="#search" id="searchStudentButton" aria-controls="search" role="tab" data-toggle="tab">Search</a></li>'+
                     '<li role="presentation"><a href="#filter" id="filterButton" aria-controls="filter" role="tab" data-toggle="tab">Filter</a></li>' +
                     '<li role="presentation"><a href="#filter" id="logoutButton" aria-controls="filter" role="tab" data-toggle="tab">Logout</a></li>'		
        	 */);
        	//$('#addStudent').load('bootstrap/AddStudentBootstrap.jsp');
        	if(loginOrLogout%2 == 1)
        		{
        		/* $("#loginRNoLabel").css('display', 'none');
        		$("#loginRNo").css('display', 'none');
        		$("#loginPasswordLabel").css('display', 'none');
        		$("#loginPassword").css('display', 'none'); */
        		checkLogin();
        		
        		}
        	else
        		{
        		$('#addStudent').empty();
        	 	$('#view').empty();
        		$('#search').empty();
        		$('#filter').empty();
        		/* $("#loginRNoLabel").css('display', 'block');
        		$("#loginRNo").css('display', 'block');
        		$("#loginPasswordLabel").css('display', 'block');
        		$("#loginPassword").css('display', 'block'); */
        		$("#maindiv").css('display', 'none');
        		$("#loginDiv").css('display', 'block');
        		$("#loginClick").css('margin-left', '110px');
        		loginOrLogout++;
        		document.getElementById("loginClick").innerHTML ="LOGIN";	
        		}
        });
        
        function checkLogin() {
			//alert("checking" + $("#loginRNo").val() + " " + $("#loginPassword").val());
			if($("#loginRNo").val() == '')
				alert('Enter username');
			else if($("#loginPassword").val() == '')
				alert('Enter password');
			else
				{
			var jersey_url = "http://localhost:8080/student-management-system/webapi/student/checkLogin";

			var formData = new FormData();

			formData.append('username',$("#loginRNo").val());
			formData.append('password',$("#loginPassword").val());

			
			$.ajax({
				type: 'POST', // GET
				url: jersey_url,
				data: formData,
				cache : false,
				contentType : false,
				processData : false,
				error : function(jqXHR, textStatus, errorThrown) {
					console.log('error');
					alert('Invalid login or password!!');
					//$("#messages").append("<li style='color: red;'>" + textStatus + " apa "+ errorThrown.responseText + "</li>");
				},
				success: function(data) {
					console.log('success');
					//$("#messages").append("<li style='color: red;'>" + textStatus + " apa "+ errorThrown.responseText + "</li>");
					$("#loginDiv").css('display', 'none');
					$("#maindiv").css('display', 'block');
	        		$("#loginClick").css('margin-left', '1118px');
	        		document.getElementById("loginClick").innerHTML ="LOGOUT";
	        		loginOrLogout++;
				}
			});
			
				}
		}
        
        $('#addStudentButton').click(function(){
        	console.log('loading');
            $('#addStudent').load('bootstrap/AddStudentBootstrap.jsp');
        }); 
    	 $('#viewListButton').click(function(){
        	 $('#addStudent').empty();
            $('#view').load('bootstrap/ViewListBootstrap.jsp');
        }); 
    	 $('#searchStudentButton').click(function(){
        	 	$('#addStudent').empty();
        	 	$('#view').empty();
        	 	$('#filter').empty();
            $('#search').load('bootstrap/SearchStudentBootstrap.jsp');
        }); 
         $('#filterButton').click(function(){
        	 	$('#addStudent').empty();
        	 	$('#view').empty();
        		$('#search').empty();
            $('#filter').load('bootstrap/FilterStudent.jsp');
        }); 
         $('#chatButton').click(function(){
     	 	$('#addStudent').empty();
     	 	$('#view').empty();
     		$('#search').empty();
     		//window.location='chat.jsp';
     		window.open("chat.jsp", "", "toolbar=yes,menubar=no,resizable=yes,scrollbars=yes,width=1024");
     }); 
         $('#addAdminButton').click(function(){
         	console.log('loading1');
         	$('#addStudent').empty();
    	 	$('#view').empty();
    		$('#search').empty();
             $('#newadmin').load('bootstrap/newAdminBootsrap.jsp');
         }); 
        
    });
    </script>
      </body>
</html>

