package net.abdaziz.bukutamu.controller;

import net.abdaziz.bukutamu.dao.BukuTamuDao;
import net.abdaziz.bukutamu.entity.bukutamu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BukuTamuController {
    @Autowired private BukuTamuDao bukuTamuDao;
    @GetMapping("/api/buku-tamu/")
    public Page<bukutamu> tampilkanData(Pageable pageable){
        return bukuTamuDao.findAll(pageable);
    }
}
