package com.cragardev.languages.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="languages")
public class Language {
	
	// attributes
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=2, max=20, message="===  Name must be at least 2 characters and no more than 20 characters.  ===")
	private String name;
	
	@NotNull
	@Size(min=2, max=20, message="===  Name must be at least 2 characters and no more than 20 characters.  ===")
	private String creator;
	
	@NotNull(message="===  Cannot not be blank  ===")
	@Min(value=0)
	private Double version;
	
	
	
	// This will not allow the createdAt column to be updated after creation
	@Column(updatable = false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	

	// Constructors
	
	// Empty Constructor
	public Language() {
	}
	
	
	
	// Full Constructor
	public Language(Long id, String name, String creator, Double version, Date createdAt,
			Date updatedAt) {
		this.id = id;
		this.name = name;
		this.creator = creator;
		this.version = version;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	
	// Simple Constructor
	public Language(String name, String creator, Double version) {
		this.name = name;
		this.creator = creator;
		this.version = version;
	}
	


	// Getters and Setters

	

	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getCreator() {
		return creator;
	}



	public void setCreator(String creator) {
		this.creator = creator;
	}



	public Double getVersion() {
		return version;
	}



	public void setVersion(Double version) {
		this.version = version;
	}



	public Date getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}



	public Date getUpdatedAt() {
		return updatedAt;
	}



	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}



	// PrePersist and PreUpdate
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
	
	

}
