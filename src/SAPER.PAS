program saper;
uses crt, dos, screen;
const a=20;
type poly = array[1..64] of boolean;
type miny = array[1..64] of word;
var k,l,p,i,t,ct,start,ll,minNumber,r:word;
  pola,zero,pyt,pytMin:poly;
  mina:miny;
  godz,min,sek,sek100:word;

procedure init;
begin
  asm mov cx,2000h;mov ah,1;int 10h; end;
  clrScr;
  minNumber:=10;
end;

procedure czas;
var godz1,min1,sek1,sek1001:word;
begin
  textColor(7);
  getTime(godz1,min1,sek1,sek1001);
  if sek1>sek then t:=t+sek1-sek else if ((sek1=0) and (sek<>0)) then t:=t+60-sek;
  gotoXY(a+30,3);
  write(t:4);
  sek:=sek1;
end;

procedure checkFields(g:word);
var x,y,i,q,j:word;
begin
  if g<>0 then begin
    if mina[g]=9 then
    begin 
      gotoXY(a+15,3);
      write('PRZEGRAŁEŚ!!!');
      ll:=1;
      j:=0;
      for i:=1 to 64 do if mina[i]=9 then pola[i]:=true;
    end
    else
      j:=0;
      for i:=1 to 64 do if pola[i]=true then j:=j+1;
      if j=64-minNumber then begin
        for i:=1 to 64 do pola[i]:=true;
        gotoXY(a+15,3);
        write('WYGRAŁEŚ!!!');
        ll:=1;
      end;
  end;
  x:=a+1;
  y:=8;
  for i:=1 to 64 do begin
    x:=x+4;
    if pola[i]=true then
    begin
      gotoXY(x,y);
      textColor(mina[i]+2);
      if mina[i]=9 then write('☻') else write(mina[i]);
    end else begin
      if pyt[i]=true then
      begin 
        gotoXY(x,y);
        textColor(9+2);
        write('?');
      end;
      if pytMin[i]=true then
      begin 
        gotoXY(x,y);
        textColor(9+2);
        write('☺');
      end;
    end;
    if (i mod 8)=0 then begin x:=a+1; y:=y+2 end;
  end;
end;

procedure pomoc;
begin
  printHelp;
  readKey;
  printBoard;
  checkFields(0);
end;

procedure pointZero(g:word);
var qn:word;
begin
  zero[g]:=true;
  if g=8 then begin
      pola[g+8] := true;
      if mina[g+8]=0 then if zero[g+8]=false then pointZero(g+8);
      pola[g+7] := true;
      if mina[g+7]=0 then if zero[g+7]=false then  pointZero(g+7);
      pola[g-1] := true;
      if mina[g-1]=0 then if zero[g-1]=false then  pointZero(g-1);
    end;

    if g =1 then begin
      pola[g+9] := true;
      if mina[g+9]=0 then if zero[g+9]=false then  pointZero(g+9);
      pola[g+8] := true;
      if mina[g+8]=0 then if zero[g+8]=false then  pointZero(g+8);
      pola[g+1] := true;
      if mina[g+1]=0 then if zero[g+1]=false then  pointZero(g+1);
    end;
  
    if (1 < g) and (g < 8) then begin
      pola[g-1] := true;
      if mina[g-1]=0 then if zero[g-1]=false then  pointZero(g-1);
      pola[g+1] := true;
      if mina[g+1]=0 then if zero[g+1]=false then  pointZero(g+1);
      pola[g+7] := true;
      if mina[g+7]=0 then if zero[g+7]=false then  pointZero(g+7);
      pola[g+8] := true;
      if mina[g+8]=0 then if zero[g+8]=false then  pointZero(g+8);
      pola[g+9] := true;
      if mina[g+9]=0 then if zero[g+9]=false then  pointZero(g+9);
      end;  

  if g=57 then begin
      pola[g-8] := true;
      if mina[g-8]=0 then if zero[g-8]=false then pointZero(g-8);
      pola[g-7] := true;
      if mina[g-7]=0 then if zero[g-7]=false then  pointZero(g-7);
      pola[g+1] := true;
      if mina[g+1]=0 then if zero[g+1]=false then  pointZero(g+1);
    end;

    if g =64 then begin
      pola[g-9] := true;
      if mina[g-9]=0 then if zero[g-9]=false then  pointZero(g-9);
      pola[g-8] := true;
      if mina[g-8]=0 then if zero[g-8]=false then  pointZero(g-8);
      pola[g-1] := true;
      if mina[g-1]=0 then if zero[g-1]=false then  pointZero(g-1);
    end;
  
    if (57 < g) and (g < 64) then begin
      pola[g-1] := true;
      if mina[g-1]=0 then if zero[g-1]=false then  pointZero(g-1);
      pola[g+1] := true;
      if mina[g+1]=0 then if zero[g+1]=false then  pointZero(g+1);
      pola[g-7] := true;
      if mina[g-7]=0 then if zero[g-7]=false then  pointZero(g-7);
      pola[g-8] := true;
      if mina[g-8]=0 then if zero[g-8]=false then  pointZero(g-8);
      pola[g-9] := true;
      if mina[g-9]=0 then if zero[g-9]=false then  pointZero(g-9);
      end;   	  
    
   for qn:=1 to 6 do begin
    if ((1+(8*qn) < g) and (g < 8+(8*qn))) then begin
         pola[g-9] := true;
      if mina[g-9]=0 then if zero[g-9]=false then  pointZero(g-9);
         pola[g-8] := true;
      if mina[g-8]=0 then if zero[g-8]=false then  pointZero(g-8);
         pola[g-7] := true;
      if mina[g-7]=0 then if zero[g-7]=false then pointZero(g-7);
         pola[g-1] := true;
      if mina[g-1]=0 then if zero[g-1]=false then pointZero(g-1);
         pola[g+1] := true;
      if mina[g+1]=0 then if zero[g+1]=false then pointZero(g+1);
         pola[g+7] := true;
      if mina[g+7]=0 then if zero[g+7]=false then pointZero(g+7);
         pola[g+8] := true;
      if mina[g+8]=0 then if zero[g+8]=false then pointZero(g+8);
         pola[g+9] := true;
      if mina[g+9]=0 then if zero[g+9]=false then pointZero(g+9);
   end;
  end;
       
  for qn:=1 to 6 do begin
    if (1+(8*qn) = g) then begin
      pola[g-8] := true;
      if mina[g-8]=0 then if zero[g-8]=false then pointZero(g-8);
      pola[g-7] := true;
      if mina[g-7]=0 then if zero[g-7]=false then pointZero(g-7);
      pola[g+1] := true;
      if mina[g+1]=0 then if zero[g+1]=false then pointZero(g+1);
      pola[g+8] := true;
      if mina[g+8]=0 then if zero[g+8]=false then pointZero(g+8);
      pola[g+9] := true;
      if mina[g+9]=0 then if zero[g+9]=false then pointZero(g+9);
       end;
  end;
                  
  for qn:=1 to 6 do begin
    if g = 8+(8*qn) then begin
      pola[g-9] := true;
      if mina[g-9]=0 then if zero[g-9]=false then pointZero(g-9);
      pola[g-8] := true;
      if mina[g-8]=0 then if zero[g-8]=false then pointZero(g-8);
      pola[g-1] := true;
      if mina[g-1]=0 then if zero[g-1]=false then pointZero(g-1);
      pola[g+7] := true;
      if mina[g+7]=0 then if zero[g+7]=false then pointZero(g+7);
      pola[g+8] := true;
      if mina[g+8]=0 then if zero[g+8]=false then pointZero(g+8);
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
  for i:=1 to minNumber do
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
    if keyPressed then z:=readKey else z:='?';
    case z of
      #27: k:=3;
      #59: pomoc;
      #75: 
      begin
        gotoXY(a+l,p);
        write(' ');
        checkFields(0);
        if l<>5 then l:=l-4;
        gotoXY(a+l,p);
        textColor(4);
        write('♥');
        textColor(7);
      end;
      #77: 
      begin
        gotoXY(a+l,p);
        write(' ');
        checkFields(0);
        if l<>33 then l:=l+4;
        gotoXY(a+l,p);
        textColor(4);
        write('♥');
        textColor(7);
      end;
      #72: 
      begin
        gotoXY(a+l,p);
        write(' ');
        checkFields(0);
        if p<>8 then p:=p-2;
        gotoXY(a+l,p);
        textColor(4);
        write('♥');
        textColor(7);
      end;
      #80: 
      begin
        gotoXY(a+l,p);
        write(' ');
        checkFields(0);
        if p<>22 then p:=p+2;
        gotoXY(a+l,p);
        textColor(4);
        write('♥');
        textColor(7);
      end;
      #32: 
      begin
        gx:=(l-1) div 4;
        gy:=(p-6) div 2;
        g:=(gy-1)*8+gx;
        if start=1 then begin minuj(g); getTime(godz,min,sek,sek100); end;
        gotoXY(a+l,p);
        pola[g]:=true;
        if mina[g]=0 then pointZero(g);
        checkFields(g);
      end;
      #13: 
      begin
        gx:=(l-1) div 4;
        gy:=(p-6) div 2;
        g:=(gy-1)*8+gx;
        if start=1 then begin minuj(g); getTime(godz,min,sek,sek100); end;
        gotoXY(a+l,p);
        pola[g]:=true;
        if mina[g]=0 then pointZero(g);
        checkFields(g);
      end;
      #47: 
      begin
        gx:=(l-1) div 4;
        gy:=(p-6) div 2;
        g:=(gy-1)*8+gx;
        if pola[g] = false then begin
          gotoXY(a+l,p);
          if pyt[g]=false then pyt[g]:=true else pyt[g]:=false;
          checkFields(0);
        end;
      end;
      #46: 
      begin
        gx:=(l-1) div 4;
        gy:=(p-6) div 2;
        g:=(gy-1)*8+gx;
        if pola[g] = false then begin
          gotoXY(a+l,p);
          if pytMin[g]=false then pytMin[g]:=true else pytMin[g]:=false;
          checkFields(0);
        end;
      end;
      else z:='?';
    end;
  if start=0 then czas;
  until ((k=3) or (ll=1));
  if ll=1 then readKey;
end;

procedure graj;
begin
  l:=5;
  p:=8;
  start:=1;
  printBoard;
  gotoXY(a+l,p);
  textColor(4);
  write('♥');
  textColor(7);
  nawigacja;
end;

procedure menu;
var o,g:word;
    z:char;
begin
  o:=0;
  g:=11;
  gotoXY(a+10,g);
  write('►');
  repeat
    if o=0 then begin printMenu; gotoXY(a+10,g);
    write('►');  o:=1; end;
    if o=1 then begin
      z:=readKey;
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
      #72: 
      begin
        gotoXY(a+10,g);
        write(' ');
        g:=g-2;
        if g=9 then g:=19;
        gotoXY(a+10,g);
        write('►');
      end;
      #80: 
      begin
        gotoXY(a+10,g);
        write(' ');
        g:=g+2;
        if g=21 then g:=11;
        gotoXY(a+10,g);
        write('►');
      end;
      else z:='?';
      end; 
    end;
    if o=2 then begin
      printSettings(minNumber);
      z:=readKey;
      case z of
        #27: o:=0;
        #32: o:=0;
        #13: o:=0;
        #80: 
        begin
          minNumber:=minNumber-1;
          if minNumber < 1 then minNumber:=1;
          gotoXY(a+25,13);
          write(minNumber:2);
        end;
        #72: 
        begin
          minNumber:=minNumber+1;
          if minNumber > 63 then minNumber:=63;
          gotoXY(a+25,13);
          write(minNumber:2);
        end;
      else z:='?';
      end;
    end;
    if o=3 then begin
      printHelp;
      readKey;
      o:=0;
    end;
    if o=5 then begin
      ll:=0;
      for i:=1 to 64 do begin pola[i]:=false;
        pyt[i]:=false;
        zero[i]:=false;
        pytMin[i]:=false;
        mina[i]:=0;
      end;
      k:=0; 
      t:=0;
      graj;
      o:=0;
    end;
  until (k=1);
end;

begin
  init;
  menu;
end.
