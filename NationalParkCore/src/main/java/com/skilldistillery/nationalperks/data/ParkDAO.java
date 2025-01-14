package com.skilldistillery.nationalperks.data;

import java.util.List;

import com.skilldistillery.nationalperks.entities.Park;

public interface ParkDAO {

	public List<Park> listAllParks();
	public Park findParkById(int parkId);
}
