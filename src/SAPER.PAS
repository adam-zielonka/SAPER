program saper;
uses crt,dos;
const a=20;
type poly = array[1..64] of boolean;
type miny = array[1..64] of word;
var k,l,p,i,t,ct,start,ll,lm,r:word;
	pola,zero,pyt,pytmin:poly;
	mina:miny;
	godz,min,sek,sek100:word;

procedure poczontek;
begin
  asm mov cx,2000h;mov ah,1;int 10h; end;
  clrscr;
  lm:=10;
end;

procedure plansza;
begin
  textcolor(7);
  gotoxy(a,1) ;write('╔═════════════════════════════════════╗');
  gotoxy(a,2) ;write('║                                     ║');
  gotoxy(a,3) ;write('║                                     ║');
  gotoxy(a,4) ;write('║                                     ║');
  gotoxy(a,5) ;write('╠═════════════════════════════════════╣');
  gotoxy(a,6) ;write('║                                     ║');
  gotoxy(a,7) ;write('║  ┌───┬───┬───┬───┬───┬───┬───┬───┐  ║');
  gotoxy(a,8) ;write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,9) ;write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,10);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,11);write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,12);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,13);write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,14);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,15);write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,16);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,17);write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,18);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,19);write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,20);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,21);write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoxy(a,22);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,23);write('║  └───┴───┴───┴───┴───┴───┴───┴───┘  ║');
  gotoxy(a,24);write('║                                     ║');
  gotoxy(a,25);write('╚═════════════════════════════════════╝');
  gotoxy(a+30,3);write(t:4);
end;


procedure pomocplansza;
begin
  textcolor(7);
  gotoxy(a+7,9 );write('╔═══════════════════════╗');
  gotoxy(a+7,10);write('║      INSTRUKCJA       ║');
  gotoxy(a+7,11);write('║ ENTER   ZATWIERDZANIE ║');
  gotoxy(a+7,12);write('║ SPACJA  ZATWIERDZANIE ║');
  gotoxy(a+7,13);write('║ ',#24,'       W GORE        ║');
  gotoxy(a+7,14);write('║ ',#25,'       W DOL         ║');
  gotoxy(a+7,15);write('║ ',#26,'       W PRAWO       ║');
  gotoxy(a+7,16);write('║ ',#27,'       W LEWO        ║');
  gotoxy(a+7,17);write('║ ?       PYTAJNIK      ║');
  gotoxy(a+7,18);write('║ .       MINA          ║');
  gotoxy(a+7,19);write('║ F1      POMOC         ║');
  gotoxy(a+7,20);write('║ ESC     WYJSCIE       ║');
  gotoxy(a+7,21);write('╚═══════════════════════╝');
end;

procedure czas;
var godz1,min1,sek1,sek1001:word;
begin
  textcolor(7);
gettime(godz1,min1,sek1,sek1001);
if sek1>sek then t:=t+sek1-sek else if ((sek1=0) and (sek<>0)) then t:=t+60-sek;
gotoxy(a+30,3);
write(t:4);
sek:=sek1;
end;

procedure sprpola(g:word);
var x,y,i,q,j:word;
begin
 if g<>0 then begin
 if mina[g]=9 then
 begin 
 gotoxy(a+15,3);
 write('PRZEGLALES!!!');
 ll:=1;
 j:=0;
 for i:=1 to 64 do if mina[i]=9 then pola[i]:=true;
 end
 else
 
 j:=0;
 for i:=1 to 64 do if pola[i]=true then j:=j+1;
 if j=64-lm then begin
 for i:=1 to 64 do pola[i]:=true;
 gotoxy(a+15,3);
 write('WYGRALES!!!');
 ll:=1;
 end;
 end;
 x:=a+1;
 y:=8;
 for i:=1 to 64 do begin
 x:=x+4;
 if pola[i]=true then
 begin
 gotoxy(x,y);
 textcolor(mina[i]+2);
 if mina[i]=9 then write('☻') else write(mina[i]);
 end else begin
 if pyt[i]=true then
 begin 
 gotoxy(x,y);
 textcolor(9+2);
 write('?');
 end;
 if pytmin[i]=true then
 begin 
 gotoxy(x,y);
 textcolor(9+2);
 write('☺');
 end;
 end;
 if (i mod 8)=0 then begin x:=a+1; y:=y+2 end;
 end;
end;

procedure pomoc;
begin
pomocplansza;
readkey;
plansza;
sprpola(0);
end;

procedure punktzero(g:word);
var qn:word;
begin
  zero[g]:=true;
  if g=8 then begin
	    pola[g+8] := true;
	    if mina[g+8]=0 then if zero[g+8]=false then punktzero(g+8);
	    pola[g+7] := true;
	    if mina[g+7]=0 then if zero[g+7]=false then  punktzero(g+7);
	    pola[g-1] := true;
	    if mina[g-1]=0 then if zero[g-1]=false then  punktzero(g-1);
	  end;

	  if g =1 then begin
	    pola[g+9] := true;
	    if mina[g+9]=0 then if zero[g+9]=false then  punktzero(g+9);
	    pola[g+8] := true;
	    if mina[g+8]=0 then if zero[g+8]=false then  punktzero(g+8);
	    pola[g+1] := true;
	    if mina[g+1]=0 then if zero[g+1]=false then  punktzero(g+1);
	  end;
	
	  if (1 < g) and (g < 8) then begin
	    pola[g-1] := true;
	    if mina[g-1]=0 then if zero[g-1]=false then  punktzero(g-1);
	    pola[g+1] := true;
	    if mina[g+1]=0 then if zero[g+1]=false then  punktzero(g+1);
	    pola[g+7] := true;
	    if mina[g+7]=0 then if zero[g+7]=false then  punktzero(g+7);
	    pola[g+8] := true;
	    if mina[g+8]=0 then if zero[g+8]=false then  punktzero(g+8);
	    pola[g+9] := true;
	    if mina[g+9]=0 then if zero[g+9]=false then  punktzero(g+9);
      end;  

  if g=57 then begin
	    pola[g-8] := true;
	    if mina[g-8]=0 then if zero[g-8]=false then punktzero(g-8);
	    pola[g-7] := true;
	    if mina[g-7]=0 then if zero[g-7]=false then  punktzero(g-7);
	    pola[g+1] := true;
	    if mina[g+1]=0 then if zero[g+1]=false then  punktzero(g+1);
	  end;

	  if g =64 then begin
	    pola[g-9] := true;
	    if mina[g-9]=0 then if zero[g-9]=false then  punktzero(g-9);
	    pola[g-8] := true;
	    if mina[g-8]=0 then if zero[g-8]=false then  punktzero(g-8);
	    pola[g-1] := true;
	    if mina[g-1]=0 then if zero[g-1]=false then  punktzero(g-1);
	  end;
	
	  if (57 < g) and (g < 64) then begin
	    pola[g-1] := true;
	    if mina[g-1]=0 then if zero[g-1]=false then  punktzero(g-1);
	    pola[g+1] := true;
	    if mina[g+1]=0 then if zero[g+1]=false then  punktzero(g+1);
	    pola[g-7] := true;
	    if mina[g-7]=0 then if zero[g-7]=false then  punktzero(g-7);
	    pola[g-8] := true;
	    if mina[g-8]=0 then if zero[g-8]=false then  punktzero(g-8);
	    pola[g-9] := true;
	    if mina[g-9]=0 then if zero[g-9]=false then  punktzero(g-9);
      end;   	  
		
   for qn:=1 to 6 do begin
	  if ((1+(8*qn) < g) and (g < 8+(8*qn))) then begin
	       pola[g-9] := true;
	    if mina[g-9]=0 then if zero[g-9]=false then  punktzero(g-9);
	       pola[g-8] := true;
	    if mina[g-8]=0 then if zero[g-8]=false then  punktzero(g-8);
	       pola[g-7] := true;
	    if mina[g-7]=0 then if zero[g-7]=false then punktzero(g-7);
	       pola[g-1] := true;
	    if mina[g-1]=0 then if zero[g-1]=false then punktzero(g-1);
	       pola[g+1] := true;
	    if mina[g+1]=0 then if zero[g+1]=false then punktzero(g+1);
	       pola[g+7] := true;
	    if mina[g+7]=0 then if zero[g+7]=false then punktzero(g+7);
	       pola[g+8] := true;
	    if mina[g+8]=0 then if zero[g+8]=false then punktzero(g+8);
	       pola[g+9] := true;
	    if mina[g+9]=0 then if zero[g+9]=false then punktzero(g+9);
   end;
	end;
		   
	for qn:=1 to 6 do begin
	  if (1+(8*qn) = g) then begin
	    pola[g-8] := true;
	    if mina[g-8]=0 then if zero[g-8]=false then punktzero(g-8);
	    pola[g-7] := true;
	    if mina[g-7]=0 then if zero[g-7]=false then punktzero(g-7);
	    pola[g+1] := true;
	    if mina[g+1]=0 then if zero[g+1]=false then punktzero(g+1);
	    pola[g+8] := true;
	    if mina[g+8]=0 then if zero[g+8]=false then punktzero(g+8);
	    pola[g+9] := true;
	    if mina[g+9]=0 then if zero[g+9]=false then punktzero(g+9);
       end;
	end;
              		
	for qn:=1 to 6 do begin
	  if g = 8+(8*qn) then begin
	    pola[g-9] := true;
	    if mina[g-9]=0 then if zero[g-9]=false then punktzero(g-9);
	    pola[g-8] := true;
	    if mina[g-8]=0 then if zero[g-8]=false then punktzero(g-8);
	    pola[g-1] := true;
	    if mina[g-1]=0 then if zero[g-1]=false then punktzero(g-1);
	    pola[g+7] := true;
	    if mina[g+7]=0 then if zero[g+7]=false then punktzero(g+7);
	    pola[g+8] := true;
	    if mina[g+8]=0 then if zero[g+8]=false then punktzero(g+8);
      end;
	end;
	 
	end;

procedure minuj(n:word);
var i,g,k,y,h:word;
begin
  start:=0;
  for i:=1 to 64 do pola[i]:=false;
  for i:=1 to 64 do zero[i]:=false;
  for i:=1 to 64 do mina[i]:=0;
  k:=0;
  randomize;
  for i:=1 to lm do
  begin
    repeat
      g:=random(65);
	  if ((g<>0) and (g<>n)) then if mina[g]=0 then begin mina[g]:=9; k:=1 end;
    until k=1;
    k:=0;
  end;
  for y:=0 to 7 do
  begin
    for i:=(2+(8*y)) to (7+(8*y)) do
    begin
	 if mina[i] = 0 then begin
      if mina[i-9] = 9 then mina[i]:=mina[i]+1;
	  if mina[i-8] = 9 then mina[i]:=mina[i]+1;
	  if mina[i-7] = 9 then mina[i]:=mina[i]+1;
	  if mina[i-1] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+1] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+7] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+8] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+9] = 9 then mina[i]:=mina[i]+1;
	 end;
    end;
  end;
    for y:=0 to 7 do
  begin
     i:=1+(8*y);
	 if mina[i] = 0 then begin
	  if mina[i-8] = 9 then mina[i]:=mina[i]+1;
	  if mina[i-7] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+1] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+8] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+9] = 9 then mina[i]:=mina[i]+1;
	 end;
  end;
    for y:=0 to 7 do
  begin
     i:=8+(8*y);
	 if mina[i] = 0 then begin
      if mina[i-9] = 9 then mina[i]:=mina[i]+1;
	  if mina[i-8] = 9 then mina[i]:=mina[i]+1;
	  if mina[i-1] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+7] = 9 then mina[i]:=mina[i]+1;
	  if mina[i+8] = 9 then mina[i]:=mina[i]+1;
	 end;
  end;
end;
	
procedure nawigacja;
var gx,gy,g,i,q,x,y,qn:word;
    z:char;
begin
  repeat
    if keypressed then z:=readkey else z:='?';
    case z of
      #27: k:=3;
	  #59: pomoc;
      #75: begin
	       gotoxy(a+l,p);
           write(' ');
		   sprpola(0);
	       if l<>5 then l:=l-4;
		   gotoxy(a+l,p);
		   textcolor(4);
           write('♥');
		   textcolor(7);
           end;
      #77: begin
	       gotoxy(a+l,p);
           write(' ');
		   sprpola(0);
	       if l<>33 then l:=l+4;
		   gotoxy(a+l,p);
		   textcolor(4);
           write('♥');
		   textcolor(7);
           end;
      #72: begin
	       gotoxy(a+l,p);
           write(' ');
		   sprpola(0);
	       if p<>8 then p:=p-2;
		   gotoxy(a+l,p);
		   textcolor(4);
           write('♥');
		   textcolor(7);
           end;
      #80: begin
	       gotoxy(a+l,p);
           write(' ');
		   sprpola(0);
	       if p<>22 then p:=p+2;
		   gotoxy(a+l,p);
		   textcolor(4);
           write('♥');
		   textcolor(7);
           end;
	  #32: begin
		   gx:=(l-1) div 4;
		   gy:=(p-6) div 2;
		   g:=(gy-1)*8+gx;
	       if start=1 then begin minuj(g); gettime(godz,min,sek,sek100); end;
	       gotoxy(a+l,p);
		   pola[g]:=true;
		   if mina[g]=0 then punktzero(g);
		   sprpola(g);
		   end;
	  #13: begin
		   gx:=(l-1) div 4;
		   gy:=(p-6) div 2;
		   g:=(gy-1)*8+gx;
	       if start=1 then begin minuj(g); gettime(godz,min,sek,sek100); end;
	       gotoxy(a+l,p);
		   pola[g]:=true;
		   if mina[g]=0 then punktzero(g);
		   sprpola(g);
		   end;
	 #47: begin
		   gx:=(l-1) div 4;
		   gy:=(p-6) div 2;
		   g:=(gy-1)*8+gx;
	       if pola[g] = false then begin
	       gotoxy(a+l,p);
		   if pyt[g]=false then pyt[g]:=true else pyt[g]:=false;
		   sprpola(0);
		   end;
                   end;
	 #46: begin
		   gx:=(l-1) div 4;
		   gy:=(p-6) div 2;
		   g:=(gy-1)*8+gx;
	       if pola[g] = false then begin
	       gotoxy(a+l,p);
		   if pytmin[g]=false then pytmin[g]:=true else pytmin[g]:=false;
		   sprpola(0);
		   end;
	       end;
      else z:='?';
    end;
  if start=0 then czas;
  until ((k=3) or (ll=1));
  if ll=1 then readkey;
end;

procedure graj;
begin
    l:=5;
  p:=8;
  start:=1;
  plansza;
  gotoxy(a+l,p);
  textcolor(4);
  write('♥');
  textcolor(7);
  nawigacja;
end;

procedure menu;
begin
  textcolor(7);
  gotoxy(a,1) ;write('╔═════════════════════════════════════╗');
  gotoxy(a,2) ;write('║                                     ║');
  gotoxy(a,3) ;write('║                                     ║');
  gotoxy(a,4) ;write('║                                     ║');
  gotoxy(a,5) ;write('╠═════════════════════════════════════╣');
  gotoxy(a,6) ;write('║                                     ║');
  gotoxy(a,7) ;write('║  ┌───┬───┬───┬───┬───┬───┬───┬───┐  ║');
  gotoxy(a,8) ;write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,9) ;write('║  ├───╔═══════════════════════╗───┤  ║');
  gotoxy(a,10);write('║  │   ║                       ║   │  ║');
  gotoxy(a,11);write('║  ├───║    START              ║───┤  ║');
  gotoxy(a,12);write('║  │   ║                       ║   │  ║');
  gotoxy(a,13);write('║  ├───║    USTAWIENIA         ║───┤  ║');
  gotoxy(a,14);write('║  │   ║                       ║   │  ║');
  gotoxy(a,15);write('║  ├───║    INSTRUKCJA         ║───┤  ║');
  gotoxy(a,16);write('║  │   ║                       ║   │  ║');
  gotoxy(a,17);write('║  ├───║    NAJLEPSZE WYNIKI   ║───┤  ║');
  gotoxy(a,18);write('║  │   ║                       ║   │  ║');
  gotoxy(a,19);write('║  ├───║    WYJSCIE            ║───┤  ║');
  gotoxy(a,20);write('║  │   ║                       ║   │  ║');
  gotoxy(a,21);write('║  ├───╚═══════════════════════╝───┤  ║');
  gotoxy(a,22);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,23);write('║  └───┴───┴───┴───┴───┴───┴───┴───┘  ║');
  gotoxy(a,24);write('║                                     ║');
  gotoxy(a,25);write('╚═════════════════════════════════════╝');
end;

procedure ustawienia;
begin
  textcolor(7);
  gotoxy(a,1) ;write('╔═════════════════════════════════════╗');
  gotoxy(a,2) ;write('║                                     ║');
  gotoxy(a,3) ;write('║                                     ║');
  gotoxy(a,4) ;write('║                                     ║');
  gotoxy(a,5) ;write('╠═════════════════════════════════════╣');
  gotoxy(a,6) ;write('║                                     ║');
  gotoxy(a,7) ;write('║  ┌───┬───┬───┬───┬───┬───┬───┬───┐  ║');
  gotoxy(a,8) ;write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,9) ;write('║  ├───╔═══════════════════════╗───┤  ║');
  gotoxy(a,10);write('║  │   ║                       ║   │  ║');
  gotoxy(a,11);write('║  ├───║    USTAWIENIA         ║───┤  ║');
  gotoxy(a,12);write('║  │   ║                 ',#30,'     ║   │  ║');
  gotoxy(a,13);write('║  ├───║    LICZBA MIN: ',lm:2,'     ║───┤  ║');
  gotoxy(a,14);write('║  │   ║                 ',#31,'     ║   │  ║');
  gotoxy(a,15);write('║  ├───║                       ║───┤  ║');
  gotoxy(a,16);write('║  │   ║                       ║   │  ║');
  gotoxy(a,17);write('║  ├───║                       ║───┤  ║');
  gotoxy(a,18);write('║  │   ║                       ║   │  ║');
  gotoxy(a,19);write('║  ├───║                       ║───┤  ║');
  gotoxy(a,20);write('║  │   ║                       ║   │  ║');
  gotoxy(a,21);write('║  ├───╚═══════════════════════╝───┤  ║');
  gotoxy(a,22);write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoxy(a,23);write('║  └───┴───┴───┴───┴───┴───┴───┴───┘  ║');
  gotoxy(a,24);write('║                                     ║');
  gotoxy(a,25);write('╚═════════════════════════════════════╝');
end;

procedure menunavi;
var o,g:word;
    z:char;
begin
o:=0;
g:=11;
gotoxy(a+10,g);
write('►');
repeat
if o=0 then begin menu; gotoxy(a+10,g);
write('►');  o:=1; end;
if o=1 then begin
        
        z:=readkey;
        case z of
         #27: k:=1;
		 #32: case g of
		      11: o:=5;
		      13: o:=2;
			  15: o:=3;
			  {17: o:=5;}
			  19: k:=1;
                          end;
		 #13: case g of
		      11: o:=5;
		      13: o:=2;
			  15: o:=5;
			  {17: o:=5;}
			  19: k:=1;
                          end; 
		 #59: o:=3;
		 #72: begin
		       gotoxy(a+10,g);
		       write(' ');
               g:=g-2;
		       if g=9 then g:=19;
		       gotoxy(a+10,g);
		       write('►');
		      end;
		 #80: begin
		       gotoxy(a+10,g);
		       write(' ');
               g:=g+2;
		       if g=21 then g:=11;
		       gotoxy(a+10,g);
		       write('►');
		      end;
         else z:='?';
        end; end;
if o=2 then begin
ustawienia;

        z:=readkey;
        case z of
         #27: o:=0;
		 #32: o:=0;
		 #13: o:=0;
		 #80: begin
		       lm:=lm-1;
			   if lm < 1 then lm:=1;
		       gotoxy(a+25,13);
		       write(lm:2);
		      end;
		 #72: begin
		       lm:=lm+1;
			   if lm > 63 then lm:=63;
		       gotoxy(a+25,13);
		       write(lm:2);
		      end;
         else z:='?';
		 end;
end;

if o=3 then begin
pomocplansza;
readkey;
o:=0;
end;

if o=5 then begin
ll:=0;
  for i:=1 to 64 do begin pola[i]:=false;
						  pyt[i]:=false;
						  zero[i]:=false;
						  pytmin[i]:=false;
      					  mina[i]:=0;     end;
						  k:=0; 
t:=0;
  graj;
  o:=0;
    

  end;
  
until (k=1);
end;

begin
  poczontek;
  menunavi;
end.
