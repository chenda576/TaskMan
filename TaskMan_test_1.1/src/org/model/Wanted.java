package org.model;

/**
 * Wanted entity. @author MyEclipse Persistence Tools
 */

public class Wanted implements java.io.Serializable {

	// Fields

	private WantedId id;

	// Constructors

	/** default constructor */
	public Wanted() {
	}

	/** full constructor */
	public Wanted(WantedId id) {
		this.id = id;
	}

	// Property accessors

	public WantedId getId() {
		return this.id;
	}

	public void setId(WantedId id) {
		this.id = id;
	}

}