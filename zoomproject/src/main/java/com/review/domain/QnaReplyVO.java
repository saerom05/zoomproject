package com.review.domain;

import java.util.Date;

public class QnaReplyVO {

  private Integer rno;
  private Integer no;
  private String replytext;
  private String replyer;

  private Date regdate;
  private Date updatedate;

  public Integer getRno() {
    return rno;
  }

  public void setRno(Integer rno) {
    this.rno = rno;
  }

  public Integer getno() {
    return no;
  }

  public void setno(Integer no) {
    this.no = no;
  }

  public String getReplytext() {
    return replytext;
  }

  public void setReplytext(String replytext) {
    this.replytext = replytext;
  }

  public String getReplyer() {
    return replyer;
  }

  public void setReplyer(String replyer) {
    this.replyer = replyer;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  public Date getUpdatedate() {
    return updatedate;
  }

  public void setUpdatedate(Date updatedate) {
    this.updatedate = updatedate;
  }

  @Override
  public String toString() {
    return "QnaReplyVO [rno=" + rno + ", no=" + no + ", replytext=" + replytext + ", replyer=" + replyer + ", regdate="
        + regdate + ", updatedate=" + updatedate + "]";
  }
}
