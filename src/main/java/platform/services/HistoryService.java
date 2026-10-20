package platform.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import platform.dtos.HistoryDto;
import platform.entities.History;
import platform.repositories.HistoryRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HistoryService {
    private final HistoryRepository historyRepository;

    public List<HistoryDto> getHistories(){
        List<History> histories = historyRepository.findAllByOrderByDateDesc();
        List<HistoryDto> dtos = histories
                .stream()
                .map(HistoryDto::getInstance)
                .toList();
        return dtos;
    }
}
