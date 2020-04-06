-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is

begin
    if (rising_edge(clock)) then
        if (t = '0') then
            q <=q;
        elsif (t='1') then
            q <= notq;
        end if;
    end if;

end architecture;