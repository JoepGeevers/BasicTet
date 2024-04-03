10 print "basictet"
20 gosub 100
30 end

100 rem **** read tetronimos ****
120 for t = 0 to 6
130 : for r = 0 to 3
140 :   read a(t, r)
150 : next r
160 next t
170 return

1000 rem **** data ****
1010 data 1,2,3,4
1020 data 5,6,7,8
1030 data 1,2,3,4
1040 data 5,6,7,8
1050 data 1,2,3,4
1060 data 5,6,7,8
1070 data 1,2,3,4