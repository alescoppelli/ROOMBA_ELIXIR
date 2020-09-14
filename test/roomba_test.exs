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




end
