10 print "basictet"
20 gosub 100: rem read tetronimos

25 x = 10: y = 5: t = 0: r = 0
28 for y = 5 to 20 step 5
30 : gosub 200: rem render tetronimo
35 : r = r + 1
40 next y

99 end

100 rem **** read tetronimos ****
120 for t = 0 to 0
130 : for r = 0 to 3
135 :   for l = 0 to 3
140 :     read sq(t, r, l): rem square
145 :   next l
150 : next r
160 next t
199 return

200 rem **** render tetronimo
205 for l = 0 to 3
210 : for s = 0 to 3
220 :   if (sq(t, r, l) and 2^s) > 0 then poke 1024+x+s+(y+l)*40, 215
230 : next s
240 next l
299 return

1000 rem **** data ****
1010 data 7,2,0,0: rem tetronimo 0, rotation 0, line 1-4
1020 data 4,6,4,0: rem tetronimo 0, rotation 1, line 1-4
1030 data 0,2,7,0: rem tetronimo 0, rotation 2, line 1-4
1040 data 1,3,1,0: rem tetronimo 0, rotation 3, line 1-4
