package platform.entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@Table(name = "contents")
public class Content {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String task;

    @Column(length = 4000)
    private String text;

    @Column
    private String url;

    @Column
    private String code;

    @Column(name = "sort")
    private int order;

    @Column(name = "num_value")
    private int numValue;

    @ToString.Exclude
    @ManyToOne
    @JoinColumn(name = "type_id", nullable = true)
    private ContentType type;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menu_item_id", nullable = true)
    private MenuItem menuItem;

    @ToString.Exclude
    @OneToMany(mappedBy = "content", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ContentSentence> sentences;
}