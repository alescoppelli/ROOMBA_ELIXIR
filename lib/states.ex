defmodule Roomba.States do
   use Machinery,
      
   states: [ "off", "passive", "safe", "full"],
   transitions: %{
           "off"     => "passive",
           "passive" => ["off","safe","full"],
           "safe"    => "passive",
           "full"    => "passive",
        }
end
