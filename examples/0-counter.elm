import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)

import Controls exposing (..)


main : Program Never
main =
  App.program
    { init = init
    , subscriptions = always Sub.none
    , update = update
    , view = view
    }


-- MODEL


type alias Model =
  { controls : Controls
  }


init : (Model, Cmd Msg)
init =
  ( { controls = controls.instance.empty }
  , Cmd.none
  )


-- UPDATE


type Msg
  = Reset
  | ControlMsg Controls.Msg


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Reset ->
      init

    ControlMsg msg' ->
      controls.pass ControlMsg msg' model


-- VIEW


view : Model -> Html Msg
view model =
  div
    []
    [ controls.counters.render (ControlMsg << Controls.CounterMsg) [0] model.controls
    , button [ onClick Reset ] [ text "RESET" ]
    , controls.help.render (ControlMsg << Controls.HelpMsg) model.controls
    ]
