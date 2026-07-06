package com.riya.matdaanportal.dao;

import java.util.List;

import com.riya.matdaanportal.pojo.candidate;

public interface candidateDao
{
 boolean addcandidate(candidate c);
 boolean deletecandidate(candidate c);
 boolean updatecandidate(candidate c);
 candidate searchCandidate(String name);
 
}
