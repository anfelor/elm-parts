module Controls exposing (Controls, controls, Msg(..))

import Parts exposing (..)
import Counters exposing (..)
import Help exposing (..)

type alias Controls = 
  { counters : Counters
  , help : Help
  }


init : Controls
init =
  { counters = counters.all.empty
  , help = help.instance.empty
  }

type Msg
  = CounterMsg (Counters.Msg, Counters.ID)
  | HelpMsg Help.Msg


update : Msg -> Controls -> (Controls, Cmd Msg)
update msg model =
  case msg of
    CounterMsg msg' -> 
      counters.pass CounterMsg msg' model

    HelpMsg msg' -> 
      help.pass HelpMsg msg' model

controls =
  let 
    def = newController init update .controls 
         (\container collection -> { container | controls = collection })
  in
    { pass = def.pass, instance = def.instance, help = help, counters = counters }