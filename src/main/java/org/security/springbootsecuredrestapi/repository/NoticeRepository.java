package org.security.springbootsecuredrestapi.repository;

import java.util.List;

import org.security.springbootsecuredrestapi.model.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {

	@Query(value = "SELECT * FROM notice_details n WHERE CURRENT_DATE BETWEEN n.notic_beg_dt AND n.notic_end_dt", nativeQuery = true)
	List<Notice> findAllActiveNotices();

}
