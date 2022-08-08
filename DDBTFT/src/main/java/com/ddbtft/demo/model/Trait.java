package com.ddbtft.demo.model;

import lombok.Data;

@Data
public class Trait implements Comparable<Trait>{

		String name;
		int num_units;
		int style;
		int tier_current;
		int tier_total;
		
		@Override
		public int compareTo(Trait t) {
			if(t.style < style) {
				return 1;
			} else if (t.style > style) {
				return -1;
			}
			return 0;
		}
}
