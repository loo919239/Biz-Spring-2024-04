package com.nono.nemo.model;

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
