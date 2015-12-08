/**
 * 
 */

function check() {
	document.addStudent.action="InsertStudentAction";
	document.addStudent.submit();
}
function  cancel() {
	
	if(addStudent.stuNum.value==""){
		alert("请输入学号");
		addStudent.stuNum.focus();
		return false;
	}
	
	//姓名
	if(addStudent.stuName.value=""){
		alert("请输入姓名");
		addStudent.stuName.focus();
		return false;
	}
	
	//年龄
	if(addStudent.stuAge.value=""){
		alert("请输入年龄");
		addStudent.stuAge.focus();
		return;
	}
	
	//性别
	if(addStudent.stuSex.value=""){
		alert("请输入年龄");
		addStudent.stuSex.focus();
		return;
	}
	
	//楼号
	if(addStudent.stuFloor.value=""){
		alert("请输入楼号");
		addStudent.stuFloor.focus();
		return;
	}
	
	//寝室好
	if(addStudent.stuDorm.value=""){
		alert("请输入寝室号");
		addStudent.stuDorm.focus();
		return;
	}
	
	//床位号
	if(addStudent.stuBed.value=""){
		alert("请输入床位号");
		addStudent.stuBed.focus();
		return;
	}
	
	//联系方式
	if(addStudent.stuTel.value=""){
		alert("请输入联系方式");
		addStudent.stuTel.focus();
		return;
	}
} 