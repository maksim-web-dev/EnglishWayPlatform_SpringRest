package platform.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@Table(name = "level_tests")
public class LevelTest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private int num;

    @Column(nullable = false)
    private String question;

    @Column
    private String case1;

    @Column
    private String case2;

    @Column
    private String case3;

    @Column
    private int correct;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "level_id", nullable = true)
    private Level level;
}