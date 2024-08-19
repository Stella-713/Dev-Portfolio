package com.hoseoSP.mapper;

import java.util.List;

import com.hoseoSP.domain.Useage_timeVO;
import com.hoseoSP.domain.sumTimeVO;

public interface Useage_timeMapper {
	
	//@Select("select * from test_log where bno > 0")
	public List<Useage_timeVO> getList();
	public List<sumTimeVO> Month_Use();
	
	public List<Useage_timeVO> reshow(String phoneNum);
	
	public List<Useage_timeVO> WeekInterval();
	public List<Useage_timeVO> WeekInterval2();
	public List<Useage_timeVO> WeekInterval3();
	public List<Useage_timeVO> WeekInterval4();
	public List<Useage_timeVO> WeekInterval5();
	public List<Useage_timeVO> WeekInterval6();
	public List<Useage_timeVO> WeekInterval7();
	
	public List<Useage_timeVO> MonInterval();
	//public void insert(Useage_timeVO useage_time);

	//public void insertSelectKey(Useage_timeVO useage_time);
	
}
