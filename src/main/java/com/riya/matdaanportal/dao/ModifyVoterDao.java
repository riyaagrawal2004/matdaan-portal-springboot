package com.riya.matdaanportal.dao;

import java.util.List;

import com.riya.matdaanportal.pojo.ModifyVoter;

public interface ModifyVoterDao {
	boolean addVoter(ModifyVoter v);
	boolean updateVoter(ModifyVoter v);
	Boolean deleteVoter(ModifyVoter v);
	ModifyVoter getVoterById(int voter_id);
	List<ModifyVoter> getModifyVoters();
	
	

}
