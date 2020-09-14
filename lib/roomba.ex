defmodule Roomba do
  require Roomba.States

  defstruct name: "Roomba" , position: %{}


  def hello do
    :world
  end

  @spec move_to_state(%{},String.t) :: {}
  def move_to_state(struct,state) do
     Machinery.transition_to(struct,Roomba.States,state)    
  end







end
