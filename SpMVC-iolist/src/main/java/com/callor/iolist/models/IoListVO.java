package com.callor.iolist.models;

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
public class IoListVO {
	private String io_seq;
	private String io_date;
	private String io_time;
	private String io_pname;
	private String io_input;
	private String io_price;
	private String io_quan;
	private String io_total;
}
