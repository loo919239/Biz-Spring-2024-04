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
	    private int lv1_num;
	    private int lv1_row_num;
	    private int lv1_block1;
	    private int lv1_block2;
	    private int lv1_block3;
	    private int lv1_block4;
	    private int lv1_block5;
	    private String hints;
	    
	    public void setHints(String hints) {
	        this.hints = hints;
	    }

}
