package platform.entities;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@Table(name = "level_test_results")
public class LevelTestResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private String answers;

    @Column(nullable = false)
    private int score;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "level_id", nullable = true)
    private Level level;

    @Column(nullable = true)
    private String recommendation;

    @Column(name = "time", nullable = false)
    private LocalDateTime time = LocalDateTime.now();
}