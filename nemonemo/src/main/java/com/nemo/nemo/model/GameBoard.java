package com.nemo.nemo.model;

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
public class GameBoard {
    private int[][] board;
    private int[][] rowHints;
    private int[][] colHints;

    public GameBoard(int size) {
        this.board = new int[size][size];
        this.rowHints = new int[size][];
        this.colHints = new int[size][];
    }
}
