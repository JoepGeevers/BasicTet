10 print "{clear}basictet"
15 gosub 400: rem dim variables
20 gosub 100: rem read tetronimos
25 gosub 800: rem render playing field
30 gosub 300: rem game loop
40 end

100 rem **** read tetronimos ****
120 for t = 0 to 6
130 : for o = 0 to 3
135 :   for l = 0 to 3
140 :     read sq(t, o, l): rem square
145 :   next l
150 : next o
160 next t
199 return

200 rem **** render tetronimo ****
210 c = 209
220 gosub 600
230 return


300 rem **** game loop ****
310 x = 40 / 2 - 2
320 y = 5
325 t = 6
330 o = 0
335 gosub 200
340 y2 = y: x2 = x: o2 = o
341 get k$
342 if k$ = "w" then o2 = (o2 + 1) and 3
344 if k$ = "a" then x2 = x2 - 1
350 if k$ = "s" then y2 = y2 + 1
352 if k$ = "d" then x2 = x2 + 1
362 gosub 700: rem maybe transform tetronimo
380 goto 340
390 return

400 rem **** dim variables ****
405 let t = 6: rem there's 7 tetronimos
408 let o = 3: rem each tetronimo has 4 orientations
409 let l = 3: rem every orientation has 4 lines
410 dim sq(6, 3, 3): rem every line and orientation for every tetronimo
415 let x = 0: rem the horizontal position of the tetronimo
418 let y = 0: rem the vertical position of the tetronimo
420 return

500 rem **** clear tetronimo ****
510 c = 32
520 gosub 600
530 return

600 rem **** render or clear tetronimo ****
605 for l = 0 to 3
608 : tmp = 1024 + x + (y+l)*40
610 : for s = 0 to 3
620 :   if (sq(t, o, l) and 2^s) > 0 then poke tmp + s, c
630 : next s
640 next l
699 return

700 rem **** maybe render tetronimo ****
710 if y2 = y and x2 = x and o2 = o then return
720 gosub 500
730 y = y2: x = x2: o = o2
740 gosub 200
750 return

800 rem **** render playing fiel ****
810 for y = 5 to 20
820 : poke 1024 + y*40 + 14, 160
830 : poke 1024 + y*40 + 25, 160
840 next y
850 for x = 14 to 25
860 : poke 1024 + y*40 + x, 160
870 next x
880 return

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