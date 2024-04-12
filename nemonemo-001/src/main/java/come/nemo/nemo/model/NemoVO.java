package come.nemo.nemo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NemoVO {
	
    private int[][] board;
    private int[][] rowHints;
    private int[][] colHints;

    public NemoVO(int size) {
        this.board = new int[size][size];
        this.rowHints = new int[size][];
        this.colHints = new int[size][];
    }
    // 추가: size를 인자로 받아 크기가 size인 게임 보드를 생성하는 메서드
    public static NemoVO createBoardOfSize(int size) {
        return new NemoVO(size);
    }

}
