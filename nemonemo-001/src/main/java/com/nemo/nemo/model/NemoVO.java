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
public class NemoVO {
	
	    private Long id;
	    private int n_num;
	    private int n_row_num;
	    private int n_block1;
	    private int n_block2;
	    private int n_block3;
	    private int n_block4;
	    private int n_block5;
	    private int n_block6;
	    private int n_block7;
	    private int n_block8;
	    private int n_block9;
	    private int n_block10;
	    private int n_block11;
	    private int n_block12;
	    private int n_block13;
	    private int n_block14;
	    private int n_block15;
	    private String hints;
	    
	    public void setHints(String hints) {
	        this.hints = hints;
	    }

}
