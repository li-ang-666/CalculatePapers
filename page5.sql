{ "000" :"[checkpoint] table: equity_ratio, pivot: 7,785,473, upperBound: 625,568,150,424,790, lag: 625,568,142,639,317",
"001" :"[checkpoint] table: equity_ratio, pivot: 1,251,136,300,849,579, upperBound: 1,251,136,300,849,579, lag: 0",
"002" :"[checkpoint] table: equity_ratio, pivot: 1,876,704,451,274,368, upperBound: 1,876,704,451,274,368, lag: 0",
"003" :"[checkpoint] table: equity_ratio, pivot: 2,502,272,601,699,157, upperBound: 2,502,272,601,699,157, lag: 0",
"004" :"[checkpoint] table: equity_ratio, pivot: 3,127,840,752,123,946, upperBound: 3,127,840,752,123,946, lag: 0",
"005" :"[checkpoint] table: equity_ratio, pivot: 3,753,408,902,548,735, upperBound: 3,753,408,902,548,735, lag: 0",
"006" :"[checkpoint] table: equity_ratio, pivot: 4,378,977,052,973,524, upperBound: 4,378,977,052,973,524, lag: 0",
"007" :"[checkpoint] table: equity_ratio, pivot: 5,004,545,203,398,313, upperBound: 5,004,545,203,398,313, lag: 0",
"008" :"[checkpoint] table: equity_ratio, pivot: 5,630,113,353,823,102, upperBound: 5,630,113,353,823,102, lag: 0",
"009" :"[checkpoint] table: equity_ratio, pivot: 6,255,681,504,247,891, upperBound: 6,255,681,504,247,891, lag: 0",
"010" :"[checkpoint] table: equity_ratio, pivot: 6,881,249,654,672,680, upperBound: 6,881,249,654,672,680, lag: 0",
"011" :"[checkpoint] table: equity_ratio, pivot: 7,506,817,805,097,469, upperBound: 7,506,817,805,097,469, lag: 0",
"012" :"[checkpoint] table: equity_ratio, pivot: 8,132,385,955,522,258, upperBound: 8,132,385,955,522,258, lag: 0",
"013" :"[checkpoint] table: equity_ratio, pivot: 8,757,954,105,947,047, upperBound: 8,757,954,105,947,047, lag: 0",
"014" :"[checkpoint] table: equity_ratio, pivot: 9,383,522,256,371,836, upperBound: 9,383,522,256,371,836, lag: 0",
"015" :"[checkpoint] table: equity_ratio, pivot: 10,009,090,356,663,400, upperBound: 10,009,090,406,796,625, lag: 50,133,225" }



alter table hudi_ads.cooperation_partner drop partition(pt=0);
alter table hudi_ads.cooperation_partner partition(pt=1) rename to partition(pt=0);
