package hibernate;
// Generated 2015-12-7 18:32:22 by Hibernate Tools 3.4.0.CR1

/**
 * StuInfo generated by hbm2java
 */
public class StuInfo implements java.io.Serializable {

	private String stuNum;
	private String stuName;
	private int stuAge;
	private String stuSex;
	private String stuFloorNum;
	private String stuDormNum;
	private int stuBedNum;
	private String stuTel;

	public StuInfo() {
	}

	public StuInfo(String stuNum, String stuName, int stuAge, String stuSex, String stuFloorNum, String stuDormNum,
			int stuBedNum, String stuTel) {
		this.stuNum = stuNum;
		this.stuName = stuName;
		this.stuAge = stuAge;
		this.stuSex = stuSex;
		this.stuFloorNum = stuFloorNum;
		this.stuDormNum = stuDormNum;
		this.stuBedNum = stuBedNum;
		this.stuTel = stuTel;
	}

	public String getStuNum() {
		return this.stuNum;
	}

	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}

	public String getStuName() {
		return this.stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getStuAge() {
		return this.stuAge;
	}

	public void setStuAge(int stuAge) {
		this.stuAge = stuAge;
	}

	public String getStuSex() {
		return this.stuSex;
	}

	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}

	public String getStuFloorNum() {
		return this.stuFloorNum;
	}

	public void setStuFloorNum(String stuFloorNum) {
		this.stuFloorNum = stuFloorNum;
	}

	public String getStuDormNum() {
		return this.stuDormNum;
	}

	public void setStuDormNum(String stuDormNum) {
		this.stuDormNum = stuDormNum;
	}

	public int getStuBedNum() {
		return this.stuBedNum;
	}

	public void setStuBedNum(int stuBedNum) {
		this.stuBedNum = stuBedNum;
	}

	public String getStuTel() {
		return this.stuTel;
	}

	public void setStuTel(String stuTel) {
		this.stuTel = stuTel;
	}

}
