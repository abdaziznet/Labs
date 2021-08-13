package net.abdaziz.bukutamu.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity @Data
public class bukutamu {
    @Id
    private String id;
    private String email;
    private String komentar;
    private LocalDateTime waktu_mengisi;
}
