defmodule RoombaTest do
  use ExUnit.Case
  doctest Roomba

  test "greets the world" do
    assert Roomba.hello() == :world
  end

  test "try to transition from 'off' to 'passive' state" do
     r = %Roomba{}
     {:ok,r} = Roomba.move_to_state(r,"passive")
     assert  Map.fetch(r,:state) == {:ok,"passive"}
  end

  test "try the denied  transition from 'off' to 'full' state" do
     r = %Roomba{}
     assert  Roomba.move_to_state(r,"full")  == {:error,"Transition to this state isn't declared."}
  end

  test "try the denied  transition from 'off' to 'safe' state" do
     r = %Roomba{}
     assert  Roomba.move_to_state(r,"safe")  == {:error,"Transition to this state isn't declared."}
  end


  test "try to open a serial port" do
   {:ok,pid  } = Roomba.SerComm.start()
   Roomba.SerComm.open(pid,"ttyUSB0",115200)
   Circuits.UART.close(pid)
   Circuits.UART.stop(pid)
  end



  test "try to write  serial port (TX/RX in C/C)" do
   {:ok,pid  } = Roomba.SerComm.start()
   Roomba.SerComm.open(pid,"ttyUSB0",115200)

   Roomba.SerComm.write(pid,"0123456789abcdefghilmnopqrstuvzABCDEFGHILMNOPQRSTUVZ")

   assert  Roomba.SerComm.read(pid) == {:ok,"0123456789abcdefghilmnopqrstuvzABCDEFGHILMNOPQRSTUVZ"   }

   Circuits.UART.close(pid)
   Circuits.UART.stop(pid)
  end









end
