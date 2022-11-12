with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
procedure Main is
   espacios: array (1 .. 2) of integer;
   Ge : Generator;
   tiempo : Uniformly_Distributed;

   task Puerto is
      Entry P(b:in Integer);
      Entry V(b:in Integer);
   end Puerto;
   Task body Puerto is
      S:Integer;
   begin
      S:=5;
      Loop
         select
            When S > 0 =>
               accept P(b:in Integer) do
                  S:= S-1;
                  Put_Line("Barco " & Integer'Image(b) & " accede al puerto");
               end P;
         or accept V(b:in Integer) do
               S:= S+1;
               Put_Line("Barco " & Integer'Image(b) & " se retira del puerto");
            end V;
         or terminate;
         end select;
      end Loop;
   end Puerto;

   task type Barco is
      entry Init(x : Integer;d : Float);
      entry irGrua;
   end Barco;

   Barcos : array (1 .. 10) of Barco;

   Task atracaderoDeEspera is
      entry P(b: in Integer; lugar: out Integer);
      entry V(b: in Integer; lugar: in Integer);
   end atracaderoDeEspera;
   Task body atracaderoDeEspera is
      S:Integer;
   begin
      S:=2;
      espacios:= (0, 0);
      Loop
         Select
            When S>0 =>
               accept P(b: in Integer; lugar: out Integer) do
                  if (not(espacios(1) = 0)) then
                     lugar:=2;
                     espacios(2):=b;
                  else
                     lugar:=1;
                     espacios(1):=b;
                  end if;
                  Put_Line ("Barco " & Integer'Image(b) & " accede al atracadero de espera " & Integer'Image(lugar));
                  S:= S-1;
               end P;
         Or	Accept V(b: in integer; lugar: in Integer) do
               Put_Line ("Barco " & Integer'Image(b) & " se retira del atracadero de espera " & Integer'Image(lugar));
               espacios(lugar):=0;
               S:= S+1;
               Barcos(b).irGrua;
            end V;
         or terminate;
         End Select;
      End loop;
   end atracaderoDeEspera;


   Task Grua is
      Entry P(noEspera:out Boolean; b:in integer;lugar: out Integer);
      Entry V(b: in integer);
   End Grua;
   Task body Grua is
      S:integer;
   begin
      S :=4;
      Loop
         Select
            When S>0 =>
               accept P(noEspera:out Boolean; b: in Integer; lugar: out Integer) do
                  if (S <= 2) then
                     noEspera:=False;
                     atracaderoDeEspera.P(b,lugar);
                  else noEspera:=True;
                     Put_Line ("Barco " & Integer'Image(b) & " accede a descargar en la grúa");
                  end if;
                  S:= S-1;
               end P;
         Or	Accept V(b:in integer) do
               Put_Line ("Barco " & Integer'Image(b) & " se retira de la grúa");
               if (not(espacios (1) = 0)) then
                  atracaderoDeEspera.V(espacios(1),1);
                  S:= S+1;
               elsif(not(espacios (2) = 0)) then
                  atracaderoDeEspera.V(espacios(2),2);
                  S:= S+1;
               else
                  S:=S+1;
               end if;
            end V;
         or terminate;
         End Select;
      End loop;
   end Grua;


   task body Barco is
      N:Integer;
      tiempo:Float;
      noEsperar:Boolean;
      lugar:integer;
   begin

      accept Init(x : Integer;d : Float) do
         N:=x;
         tiempo:=d;
      end Init;
      Delay Duration(tiempo);
      Puerto.P(N);
      Grua.P(noEsperar,N,lugar);
      if(noEsperar) then
         tiempo:=(Random (Ge));
         Delay Duration(tiempo*10.0);
         Grua.V(N);
      else
         accept irGrua do
            tiempo:=(Random (Ge));
            Delay Duration(tiempo*10.0);
            Put_Line ("Barco " & Integer'Image(N) & " accede a descargar en la grúa");
            tiempo:=(Random (Ge));
            Delay Duration(tiempo*10.0);
         end irGrua;
         Grua.V(N);
      end if;
      Puerto.V(N);
   end Barco;



begin
   Reset (Ge);

   for I in Barcos'Range loop --crear barcos
      tiempo:=(Random (Ge));
      Barcos (I).Init (I,tiempo*10.0);
   end loop;

end Main;
