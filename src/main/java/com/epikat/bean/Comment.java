package com.epikat.bean;

import java.util.Date;

public class Comment {

	int topicno;
	int postedby;
	String comment;
	Date timestamp;
	
	public int getTopicno() {
		return topicno;
	}
	public void setTopicno(int topicno) {
		this.topicno = topicno;
	}
	public int getPostedby() {
		return postedby;
	}
	public void setPostedby(int postedby) {
		this.postedby = postedby;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	
	
}
