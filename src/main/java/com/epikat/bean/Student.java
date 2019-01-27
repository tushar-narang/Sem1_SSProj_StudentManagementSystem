package com.epikat.bean;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="employee")
public class Student implements Comparable<Student>{

	String name;
	String rno;
	String picUrl;
	int marksPhysics, marksChemistry, marksMaths;
	char grade;
	//byte [] imgarray;
	
	

	public Student() {
		// TODO Auto-generated constructor stub
	}
	
	public Student(String name, String rno, int marksPhysics, int marksChemistry, int marksMaths) {
		super();
		this.name = name;
		this.rno = rno;
		this.marksPhysics = marksPhysics;
		this.marksChemistry = marksChemistry;
		this.marksMaths = marksMaths;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public int getMarksPhysics() {
		return marksPhysics;
	}
	public void setMarksPhysics(int marksPhysics) {
		this.marksPhysics = marksPhysics;
	}
	public int getMarksChemistry() {
		return marksChemistry;
	}
	public void setMarksChemistry(int marksChemistry) {
		this.marksChemistry = marksChemistry;
	}
	public int getMarksMaths() {
		return marksMaths;
	}
	public void setMarksMaths(int marksMaths) {
		this.marksMaths = marksMaths;
	}
	
	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", rno=" + rno + ", picUrl=" + picUrl + ", marksPhysics=" + marksPhysics
				+ ", marksChemistry=" + marksChemistry + ", marksMaths=" + marksMaths + ", grade=" + grade + "]";
	}

	@Override
	public int compareTo(Student s) {
		// TODO Auto-generated method stub
		
		return this.getGrade() - s.grade ;
	}

	
	


	
	
	
	
}
