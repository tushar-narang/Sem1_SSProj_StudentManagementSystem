var poolIt = function () {
	console.log("here it is : poolit function");
	var jersey_url = "/student-management-system/webapi/student/chat1/";
	console.log("new link is : /student-management-system/webapi/student/chat1/"+$("#nick").val());
    $.ajax({
        type: "GET",
        url: jersey_url + $("#nick").val(),
        dataType: "text",
        success: function (message) {
            // The message is added to the <li/> element when it is received.
            $("ul").append("<li>" + message + "</li>");
            poolIt(); // Link to the re-polling when a message is consumed.
        },
        error: function () {
        	alert("error occurred : ");
            poolIt(); // Start re-polling if an error occurs.
        }
    });
}

// When the submit button is clicked;
$("button").click(function () {
	var jersey_url = "/student-management-system/webapi/student/chat2/";
	
    if ($(".nick").css("visibility") === "visible") { // If <tr> line is visible;
        $("textarea").prop("disabled", false); // Able to enter data
        $(".nick").css("visibility", "hidden"); // Make <tr> line invisible;
        $("span").html("Chat started..");  // Information message
        //$(this).innerHTML ="Send" ;
       // document.getElementById("sendButton").innerHTML ="Send";
        // Polling operation must be initiated at a time
        console.log("button click function called : ");
        poolIt();
    }
    else  // if it is not the first time ;
        $.ajax({
            type: "POST", // HTTP POST request
            url: jersey_url + $("#nick").val(),// access to the sendMessage(..) method.
            dataType: "text", // Incoming data type -> text
            data: $("textarea").val(), // Chat message to send
            contentType: "text/plain", // The type of the sent message
            success: function (data) {

                $("span").html(data); // It writes [Message is sent..] if successful.
                $("ul").append("<li>You:" + $("textarea").val() + "</li>");
                // Blink effect
                $("span").fadeOut('fast', function () {
                    $(this).fadeIn('fast');
                });
            }
        });
});