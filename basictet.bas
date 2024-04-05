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
325 t = INT(RND(1)*7)
330 o = 0
332 y2 = y: x2 = x: o2 = o: gosub 900: rem collision detection
333 if peek(1064) = 42 then return: rem no place for this tetro
335 gosub 200
340 rem **** loop ****
341 y2 = y: x2 = x: o2 = o
342 d = d + 1: if d = 10 then d = 0: y2 = y2 + 1: goto 362
343 get k$
344 if k$ = "w" then o2 = (o2 + 1) and 3: goto 362
345 if k$ = "a" then x2 = x2 - 1: goto 362
350 if k$ = "s" then y2 = y2 + 1: goto 362
352 if k$ = "d" then x2 = x2 + 1: goto 362
357 goto 380
362 gosub 900: rem collision detection
366 if peek(1064) = 42 then goto 380
367 if peek(1064) = 218 then gosub 1000: gosub 1100: goto 310: rem land tetro
370 gosub 700: rem maybe transform tetronimo
380 goto 340

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

800 rem **** render playing field ****
810 for y = 5 to 20
820 : poke 1024 + y*40 + 14, 160
830 : poke 1024 + y*40 + 25, 160
840 next y
850 for x = 14 to 25
860 : poke 1024 + y*40 + x, 160
870 next x
880 return

900 rem **** detect colision ****
905 for l = 0 to 3
908 : tmp = 1024 + x2 + (y2+l)*40
910 : for s = 0 to 3
912 :   if (sq(t, o2, l) and 2^s) = 0 then goto 930
914 :   sc = peek(tmp + s)
915 :   if sc = 32 then goto 930
918 :   if sc = 209 then goto 930
920 :   if y2 = y then poke 1064, 42: return
922 :   poke 1064, 218: return
930 : next s
940 next l
950 poke 1064, 32
999 return

1000 rem **** render landed tetronimo ****
1010 c = 215
1020 gosub 600
1030 return

1100 rem **** remove filled lines ****
1110 for yt = y to y + 3
1115 : f = 1
1120 : for xt = 15 to 24
1125 :   if peek(1024 + yt * 40 + xt) <> 215 then f = 0
1140 : next xt
1145 : if f = 1 then gosub 1200: rem remove line yt
1198 next yt
1199 return

1200 rem **** remove line yt
1210 : for xt = 15 to 24
1220 :   poke 1024 + yt * 40 + xt, 32
1230 : next xt
1240 gosub 1300: rem move everything down
1299 return

1300 rem **** move everything down to yt
1310 for yd = yt to 5 step -1
1320 : for xd = 15 to 24
1330 :   poke 1024 + yd * 40 + xd, peek(1024 + (yd -1) * 40 + xd)
1340 : next xd
1350 next yd
1399 return

2000 rem **** data ****

2005 rem l
2010 data 0,15,0,0: rem tetronimo 0, rotation 0, line 1-4
2020 data 4,4,4,4: rem tetronimo 0, rotation 1, line 1-4
2030 data 0,0,15,0: rem tetronimo 0, rotation 2, line 1-4
2040 data 2,2,2,2: rem tetronimo 0, rotation 3, line 1-4

2105 rem p
2110 data 1, 7, 0, 0
2120 data 6, 2, 2, 0
2130 data 0, 7, 4, 0
2140 data 2, 2, 3, 0

2205 rem q
2210 data 4, 7, 0, 0
2220 data 2, 2, 6, 0
2230 data 0, 7, 1, 0
2240 data 3, 2, 2, 0

2305 rem o
2310 data 6, 6, 0, 0
2320 data 6, 6, 0, 0
2330 data 6, 6, 0, 0
2340 data 6, 6, 0, 0

2405 rem s
2410 data 6, 3, 0, 0
2420 data 2, 6, 4, 0
2430 data 0, 6, 3, 0
2440 data 1, 3, 2, 0

2505 rem t
2510 data 7,2,0,0
2520 data 4,6,4,0
2530 data 0,2,7,0
2540 data 1,3,1,0

2605 rem z
2610 data 3, 6, 0, 0
2620 data 4, 6, 2, 0
2630 data 0, 3, 6, 0
2640 data 2, 3, 1, 0