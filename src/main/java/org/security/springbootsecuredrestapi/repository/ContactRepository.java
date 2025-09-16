package org.security.springbootsecuredrestapi.repository;

import org.security.springbootsecuredrestapi.model.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ContactRepository extends CrudRepository<Contact, String> {
	
	
}