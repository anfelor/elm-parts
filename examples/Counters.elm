module Counters exposing (Counters, counters, ID, Msg(..))

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Parts exposing (..)



type alias Model = Int


init : Int -> Model
init count = 
  count


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      (model + 1, Cmd.none)

    Decrement ->
      (model - 1, Cmd.none)


view : Model -> Html Msg
view model =
  div 
    []
    [ button [ onClick Decrement ] [ text "-" ] 
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ] 
    ]


countStyle : Attribute msg
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]


type alias ID =
  Index

type alias Counters = 
  Indexed Model

counters : Factory { c | counters : Counters } Model Msg outerMsg
counters =
  makeFactory (init 0) view update .counters 
    (\container collection -> { container | counters = collection })