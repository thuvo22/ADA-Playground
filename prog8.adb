with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;
WITH Ada.Calendar;
procedure prog8 is
   Teams_Input_File: File_Type;
   Score_Input_File: File_Type;
   Team_Output_File: File_Type;
   Indiv_Output_File: File_Type;
-- Input procedures and type declarations written by Angelia Harrelson
--  for use by CS180 students on program 9

-- type declarations
type scores_ar is array(1..18) of integer;
subtype name_type is string(1..20);
type player_num_ar is array(1..3) of integer;
type team_rec is record -- stores all information about a team
   team_score : scores_ar := (others => integer'last); -- score per hole for team
   total : integer := 0; -- team total
   player_nums : player_num_ar; -- numbers of players belonging to the team
end record;
type team_ar is array(1..10) of team_rec;
 Lowest: Integer;
   Second_Lowest: Integer;
type player_rec is record -- stores all information about a player
   name : name_type; -- player name
   len : natural; -- length of player name
   team : integer; -- team to which player belongs
   Scores : Scores_Ar; -- individual score per hole

   total : integer := 0;
end record;
type play_ar is array(1..30) of player_rec;
 

-- constants
play_per_team : constant integer := 3;

   Year: Ada.Calendar.Year_number;
   Month: Ada.Calendar.Month_Number;
   Day: Ada.Calendar.Day_Number;
   Clock_Value: ada.Calendar.Time;

-- subprograms
 procedure input1(teams : out team_ar; players : out play_ar; n_t : out integer; n_p: out integer; p: out integer) is
  -- This procedure reads from the first input file (Note that users of this code need
  -- to add file input to each get and get_line), and stores the information into
  -- the proper places in the data structure
    t: integer; -- player number, team number, number of players
    teams_so_far : array(1..10) of integer := (others => 0);
      -- keeps track of number of players entered into a given team
  begin
             Get(File => Teams_Input_File,
           Item => N_T); -- number of teams
     N_P := N_T * Play_Per_Team; -- number of players

     for i in 1..n_p loop
        Get(File => Teams_Input_File,
           Item => T); -- team number

        Get(File => Teams_Input_File,
              Item => P); -- player number

        Get_Line(Teams_Input_File, players(p).name, players(p).len);
        players(p).team := t; -- players need to know team numbers
        teams_so_far(t) := teams_so_far(t) + 1; -- one more player on this team
           Teams(T).Player_Nums(Teams_So_Far(T)) := P;

     END LOOP;


  end input1;

 procedure input2(teams : in out team_ar; players : in out play_ar; n_p : in integer; n_h : out integer) is
  -- This procedure reads from the second input file (Note that users of this code need
  -- to add file input to each get), and stores the information into
  -- the proper places in the data structure
    p : integer; -- player number
 BEGIN
     Get(File => Score_Input_File,
          Item => N_H); -- number of holes
     for i in 1..n_p loop
     Get(File => Score_Input_File,
             Item => P); -- player number
        for j in 1..n_h loop
          Get(Score_Input_File,Players(P).Scores(J));

           -- if this player's score on this hole is lower than the team score on this hole,
           -- then this player's score becomes the team's score for this hole
        if players(p).scores(j) < teams(players(p).team).team_score(j) then
              teams(players(p).team).team_score(j) := players(p).scores(j);
           end if;

       END LOOP;

       END LOOP;

 END Input2;
----------------------------------------------------------------------------------
Procedure Get_Total( Players : IN out  Play_Ar; N_P : IN Integer;
      N_H : IN Integer) IS
   total: Integer:=0;
BEGIN


   FOR I IN 1..N_P LOOP
      Total:=0;
      FOR J IN 1..N_h LOOP

         total := total + Players(i).Scores(j);


      END LOOP;
      players(i).total:=total;

   END LOOP;

END Get_Total;

-----------------------------------------------------------------------------------
Procedure First_Second_Winner(Players : IN OUT Play_Ar; N_P : IN Integer) IS
BEGIN


       Lowest:=players(1).total;
   Second_Lowest:=Players(1).Total;

FOR I IN 1..N_P LOOP
         IF players(I).total <  Lowest THEN
         second_lowest:=lowest;
         Lowest:=Players(I).Total ;


         ELSIF (players(I).total< Second_Lowest AND Players(I).total /= Lowest) THEN
            Second_Lowest:=players(I).total;
      END IF;

   END LOOP;


END First_Second_Winner;

PROCEDURE Date_Of_The_Game(Clock_Value: OUT Ada.Calendar.Time) IS
   begin
   Clock_Value:=Ada.Calendar.Clock;
   Month:= Ada.Calendar.Month(Clock_Value);
   Day:= Ada.Calendar.Day(Clock_Value);
   Year:= Ada.Calendar.Year(Clock_Value);

END  Date_Of_The_Game;

--   PROCEDURE The_Lowest( Lowest_temp: OUT Lowest_Type; Teams : in OUT Team_Ar;
--   Players : in Play_Ar; N_P : in Integer;
--         N_H, N_T : IN Integer) IS

--   BEGIN
--      FOR L IN 1..N_T LOOP

--         FOR J IN 1..N_H LOOP

--         FOR I IN 1..N_P LOOP
--          Put(Teams(L).Team_Score(J),1);


--            END LOOP;
--            put(Teams(L).Team_Score(J),2);
--         END LOOP;

--      END LOOP;

--      end The_Lowest;



 ---------------------------------------------------------------------------------
   PROCEDURE Print_Out(Teams : IN  Team_Ar; Players : IN Play_Ar; N_P : IN Integer;
 N_H, N_T : IN Integer)
      IS
type lowest_type is array (1..20) of integer;
Lowest_Temp: Lowest_Type;
team_winner: Integer;
type total_type is array (1..20) of integer;
Total_Temp: Total_Type;
team_winner_num: integer;
 BEGIN

       Set_Col(Team_Output_File,5);
       Put(Team_Output_File,"Player Number");
       Set_Col(Team_Output_File,25);
       Put(Team_Output_File,"Name");
       Set_Col(Team_Output_File,45);
       Put(Team_Output_File,"Total Score");
    New_Line;
       Set_Col(Team_Output_File,5);
       Put(Team_Output_File,"-------------");
       Set_Col(Team_Output_File,25);
       Put(Team_Output_File,"----");
       Set_Col(Team_Output_File,45);
       Put(Team_Output_File,"-----------");
    New_Line;
       FOR I IN 1..N_P LOOP
       Set_Col(Team_Output_File,8);
       Put(Team_Output_File,I,2);


       Set_Col(Team_Output_File,20);
       Put(Team_Output_File,(Players(I).Name(1..Players(I).Len)));


       Set_Col(Team_Output_File,43);
       Put(Team_Output_File, Players(I).Total, 2);

    END LOOP;
    New_Line;
    Set_Col(Team_Output_File,5);
    Put(Team_Output_File,"Individual Winner    :");

    Set_Col(Team_Output_File,35);
    put(Team_Output_File,lowest,1);
    New_Line;
    Set_Col(Team_Output_File,5);
    Put(Team_Output_File,"Second Place    :");


    Set_Col(Team_Output_File,25);
    put(Team_Output_File,second_lowest,1);

    New_Line(2);
    
  
    FOR L IN 1..N_T LOOP
       Set_Col(Indiv_Output_File,3);
       Put(Indiv_Output_File, "Team# ");
       new_line(2);


       Put(Indiv_Output_File,L,1);
       
       Set_Col(Indiv_Output_File,55);
       Put(Indiv_Output_File,"Team Score ");
       New_Line;
     
       total_temp(L):=0;
       FOR J IN 1..N_H LOOP
          Lowest_Temp(J):=  Teams(L).Team_Score(J);
          

          New_Line;
          Set_Col(Indiv_Output_File,5);
          Put(Indiv_Output_File, "Hole " );

          Put(Indiv_Output_File,J,1);
          Set_Col(Indiv_Output_File,25);
          FOR I IN 1..N_P LOOP

          if Players(I).Team = L then
                Put(Indiv_Output_File, Players(i).Scores(J),5);
             END IF;

          END LOOP;
         Set_Col(Indiv_Output_File,55);
         put(Indiv_Output_File, lowest_temp(j),4);
          New_Line;
          
          Total_Temp(L):= Total_Temp(L) +Lowest_Temp(J);
          

       END LOOP;
       
       
       IF (Team_Winner > Total_Temp(L)) or (Team_Winner = Total_Temp(L))  THEN 
          Team_Winner:= Total_Temp(L);
         
       END IF;
       set_col(Indiv_Output_File,3); 
       Put(Indiv_Output_File,"Total");
       set_col(Indiv_Output_File,55);
       Put(Indiv_Output_File,Total_Temp(L),5); 
       
       
       IF Team_Winner= Total_Temp(L) THEN 
       team_winner_num:=L;
       END IF;
       
    END LOOP;
    New_Line;
    set_col(Indiv_Output_File,3);
    Put(Indiv_Output_File,"Team Winner:  Team ");
    put(Indiv_Output_File,team_winner_num,3);

    




 END Print_Out;


---------------------------Declaration of main program---------------------------
  Team: Team_Ar;
 Player: Play_Ar;
  Nt: Integer;
  Nh: Integer;
 Np, p : Integer;


BEGIN -- main
   Open(
      File => Teams_Input_File,
      Mode => In_File,
      Name => "teams.txt");
   Open(
      File => Score_Input_File,
      Mode => In_file,
      Name => "scores.txt");
   Create(
      File      => Team_Output_File,
      Mode      => Out_File,
      Name      => "team.txt");
   Create(
      File      => Indiv_Output_File,
      Mode      => Out_File,
      Name      => "indiv.txt ");

   input1(team, player, nt, np, p);
   Input2(Team, Player, Np, Nh);
   Get_Total(Player, Np, Nh);
   First_Second_Winner( Player, Np);
   Date_Of_The_Game(Clock_Value);
   Print_Out(Team, Player, Np, Nh, nt);


   Close(File => Teams_Input_File);
   Close(File => Score_Input_File);
   Close(File => Team_Output_File);
   Close(File => Indiv_Output_File);

end prog8;