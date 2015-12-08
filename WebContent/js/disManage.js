/**
 * 
 */
function typeCheck() {
	if ($(".disType").val()=="学生违纪") {
		alert("学生违纪");
		document.addDis.action="addDisStudentAction";
		document.addDis.submit(); 
	}else{
		alert("寝室违纪");
		document.addDis.action="addDisDormAction";
		document.addDis.submit(); 
	}
	
}