unit screen;
interface

procedure printBoard;
procedure printHelp;
procedure printMenu;
procedure printSettings(minNumber: word);

implementation
uses crt, dos;

procedure printBoard;
begin
  textColor(7);
  gotoXY(20,  1); write('╔═════════════════════════════════════╗');
  gotoXY(20,  2); write('║                                     ║');
  gotoXY(20,  3); write('║                                     ║');
  gotoXY(20,  4); write('║                                     ║');
  gotoXY(20,  5); write('╠═════════════════════════════════════╣');
  gotoXY(20,  6); write('║                                     ║');
  gotoXY(20,  7); write('║  ┌───┬───┬───┬───┬───┬───┬───┬───┐  ║');
  gotoXY(20,  8); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20,  9); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 10); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 11); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 12); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 13); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 14); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 15); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 16); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 17); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 18); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 19); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 20); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 21); write('║  ├───┼───┼───┼───┼───┼───┼───┼───┤  ║');
  gotoXY(20, 22); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 23); write('║  └───┴───┴───┴───┴───┴───┴───┴───┘  ║');
  gotoXY(20, 24); write('║                                     ║');
  gotoXY(20, 25); write('╚═════════════════════════════════════╝');
  (* gotoXY(50,  3); write(t:4); *)
end;

procedure printHelp;
begin
  textColor(7);
  gotoXY(27,  9); write('╔═══════════════════════╗');
  gotoXY(27, 10); write('║      INSTRUKCJA       ║');
  gotoXY(27, 11); write('║ ENTER   ZATWIERDZANIE ║');
  gotoXY(27, 12); write('║ SPACJA  ZATWIERDZANIE ║');
  gotoXY(27, 13); write('║ ',#24,'       W GORE        ║');
  gotoXY(27, 14); write('║ ',#25,'       W DOL         ║');
  gotoXY(27, 15); write('║ ',#26,'       W PRAWO       ║');
  gotoXY(27, 16); write('║ ',#27,'       W LEWO        ║');
  gotoXY(27, 17); write('║ ?       PYTAJNIK      ║');
  gotoXY(27, 18); write('║ .       MINA          ║');
  gotoXY(27, 19); write('║ F1      POMOC         ║');
  gotoXY(27, 20); write('║ ESC     WYJŚCIE       ║');
  gotoXY(27, 21); write('╚═══════════════════════╝');
end;

procedure printMenu;
begin
  textColor(7);
  gotoXY(20,  1); write('╔═════════════════════════════════════╗');
  gotoXY(20,  2); write('║                                     ║');
  gotoXY(20,  3); write('║                                     ║');
  gotoXY(20,  4); write('║                                     ║');
  gotoXY(20,  5); write('╠═════════════════════════════════════╣');
  gotoXY(20,  6); write('║                                     ║');
  gotoXY(20,  7); write('║  ┌───┬───┬───┬───┬───┬───┬───┬───┐  ║');
  gotoXY(20,  8); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20,  9); write('║  ├───╔═══════════════════════╗───┤  ║');
  gotoXY(20, 10); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 11); write('║  ├───║    START              ║───┤  ║');
  gotoXY(20, 12); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 13); write('║  ├───║    USTAWIENIA         ║───┤  ║');
  gotoXY(20, 14); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 15); write('║  ├───║    INSTRUKCJA         ║───┤  ║');
  gotoXY(20, 16); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 17); write('║  ├───║    NAJLEPSZE WYNIKI   ║───┤  ║');
  gotoXY(20, 18); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 19); write('║  ├───║    WYJŚCIE            ║───┤  ║');
  gotoXY(20, 20); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 21); write('║  ├───╚═══════════════════════╝───┤  ║');
  gotoXY(20, 22); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 23); write('║  └───┴───┴───┴───┴───┴───┴───┴───┘  ║');
  gotoXY(20, 24); write('║                                     ║');
  gotoXY(20, 25); write('╚═════════════════════════════════════╝');
end;

procedure printSettings(minNumber: word);
begin
  textColor(7);
  gotoXY(20,  1); write('╔═════════════════════════════════════╗');
  gotoXY(20,  2); write('║                                     ║');
  gotoXY(20,  3); write('║                                     ║');
  gotoXY(20,  4); write('║                                     ║');
  gotoXY(20,  5); write('╠═════════════════════════════════════╣');
  gotoXY(20,  6); write('║                                     ║');
  gotoXY(20,  7); write('║  ┌───┬───┬───┬───┬───┬───┬───┬───┐  ║');
  gotoXY(20,  8); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20,  9); write('║  ├───╔═══════════════════════╗───┤  ║');
  gotoXY(20, 10); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 11); write('║  ├───║    USTAWIENIA         ║───┤  ║');
  gotoXY(20, 12); write('║  │   ║                 ',#30,'     ║   │  ║');
  gotoXY(20, 13); write('║  ├───║    LICZBA MIN: ',minNumber:2,'     ║───┤  ║');
  gotoXY(20, 14); write('║  │   ║                 ',#31,'     ║   │  ║');
  gotoXY(20, 15); write('║  ├───║                       ║───┤  ║');
  gotoXY(20, 16); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 17); write('║  ├───║                       ║───┤  ║');
  gotoXY(20, 18); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 19); write('║  ├───║                       ║───┤  ║');
  gotoXY(20, 20); write('║  │   ║                       ║   │  ║');
  gotoXY(20, 21); write('║  ├───╚═══════════════════════╝───┤  ║');
  gotoXY(20, 22); write('║  │   │   │   │   │   │   │   │   │  ║');
  gotoXY(20, 23); write('║  └───┴───┴───┴───┴───┴───┴───┴───┘  ║');
  gotoXY(20, 24); write('║                                     ║');
  gotoXY(20, 25); write('╚═════════════════════════════════════╝');
end;

end.
