package platform.dtos;

import lombok.Data;
import platform.entities.History;

import java.time.format.DateTimeFormatter;

@Data
public class HistoryDto {
    private Long id;
    private String date;
    private String type;
    private String info;
    private String userName;

    public static HistoryDto getInstance(History history) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        HistoryDto dto = new HistoryDto();
        dto.setId(history.getId());
        dto.setDate(history.getDate().format(formatter));
        dto.setType(history.getType());
        dto.setInfo(history.getInfo());
        dto.setUserName(history.getUser().getName() +" - "+history.getUser().getEmail());
        return dto;
    }
}
