defmodule Roomba.SerComm do

  def start() do
    Circuits.UART.start_link
  end

  def open(pid,port,speed) do
     Circuits.UART.open(pid,port,speed: speed, active: false)
  end

  def write(pid, data) do
     Circuits.UART.write(pid,data)
     Circuits.UART.drain(pid)
  end

  def read(pid) do
    Circuits.UART.read(pid)
  end


end