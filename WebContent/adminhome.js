 var v=0

window.onload = function(){
    	document.getElementById("b1").onclick= function(){
    		document.getElementById("Content").innerHTML="<br><br><br>Enter Username <br> <form action='adminhome.jsp'name='adminform' method='post'>" +
    				"Username :<input type='text' name='username'> " +
    				"<br> <input type='submit' value='Search'></form>"
    		v=1
    		document.getElementById("stat").innerHTML="";
    		
    		//document.location.reload() 
    		
    	};
   
    	document.getElementById("b3").onclick= function(){
    		window.location.href = "due.jsp";
    			v=3
    			//document.location.reload() 
    	};
    	//document.getElementById("content").innerHTML="Hello" + document.getElementById("uname");
}