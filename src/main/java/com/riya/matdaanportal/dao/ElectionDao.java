package com.riya.matdaanportal.dao;

import com.riya.matdaanportal.pojo.Election;

public interface ElectionDao 
{
	boolean setActiveElection(String electionType);
    Election getActiveElection();
}
