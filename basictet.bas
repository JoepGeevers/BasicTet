10 print "{clear}basictet"
20 gosub 100: rem read tetronimos
30 gosub 300: rem render tetronimos
40 end


100 rem **** read tetronimos ****
120 for t = 0 to 6
130 : for r = 0 to 3
135 :   for l = 0 to 3
140 :     read sq(t, r, l): rem square
145 :   next l
150 : next r
160 next t
199 return

200 rem **** render tetronimo ****
205 for l = 0 to 3
208 : tmp = 1024 + x + (y+l)*40
210 : for s = 0 to 3
220 :   if (sq(t, r, l) and 2^s) > 0 then poke tmp + s, 209
230 : next s
240 next l
299 return

300 rem **** render tetronimos ****
310 x = 0
320 for t = 0 to 6
325 : r = 0
330 : x = x + 5
340 : for y = 5 to 20 step 5
350 :   gosub 200: rem render tetronimo
360 :   r = r + 1
370 : next y
380 next t
390 return


1000 rem **** data ****

1005 rem l
1010 data 0,15,0,0: rem tetronimo 0, rotation 0, line 1-4
1020 data 4,4,4,4: rem tetronimo 0, rotation 1, line 1-4
1030 data 0,0,15,0: rem tetronimo 0, rotation 2, line 1-4
1040 data 2,2,2,2: rem tetronimo 0, rotation 3, line 1-4

1105 rem p
1110 data 1, 7, 0, 0
1120 data 6, 2, 2, 0
1130 data 0, 7, 4, 0
1140 data 2, 2, 3, 0

1205 rem q
1210 data 4, 7, 0, 0
1220 data 2, 2, 6, 0
1230 data 0, 7, 1, 0
1240 data 3, 2, 2, 0

1305 rem o
1310 data 6, 6, 0, 0
1320 data 6, 6, 0, 0
1330 data 6, 6, 0, 0
1340 data 6, 6, 0, 0

1405 rem s
1410 data 6, 3, 0, 0
1420 data 2, 6, 4, 0
1430 data 0, 6, 3, 0
1440 data 1, 3, 2, 0

1505 rem t
1510 data 7,2,0,0
1520 data 4,6,4,0
1530 data 0,2,7,0
1540 data 1,3,1,0

1605 rem z
1610 data 3, 6, 0, 0
1620 data 4, 6, 2, 0
1630 data 0, 3, 6, 0
1640 data 2, 3, 1, 0