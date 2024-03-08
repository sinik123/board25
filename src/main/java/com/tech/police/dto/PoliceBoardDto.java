package com.tech.police.dto;

import java.sql.Timestamp;

public class PoliceBoardDto {

	private int pnum;
	private String ptitle;
	private String pcontent;
	private String pwriter;
	private Timestamp pregdate;
	private int phit;
	private String pfilesrc;

	public PoliceBoardDto() {

	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPwriter() {
		return pwriter;
	}

	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}

	public Timestamp getPregdate() {
		return pregdate;
	}

	public void setPregdate(Timestamp pregdate) {
		this.pregdate = pregdate;
	}

	public int getPhit() {
		return phit;
	}

	public void setPhit(int phit) {
		this.phit = phit;
	}

	public String getPfilesrc() {
		return pfilesrc;
	}

	public void setPfilesrc(String pfilesrc) {
		this.pfilesrc = pfilesrc;
	}

}
