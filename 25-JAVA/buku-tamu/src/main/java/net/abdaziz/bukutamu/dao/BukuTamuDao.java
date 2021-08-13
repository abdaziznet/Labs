package net.abdaziz.bukutamu.dao;

import net.abdaziz.bukutamu.entity.bukutamu;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BukuTamuDao extends PagingAndSortingRepository<bukutamu,String> {
}
