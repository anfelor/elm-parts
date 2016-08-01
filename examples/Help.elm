module Help exposing (Help, help, Msg(..))

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Parts exposing (..)


-- MODEL


type alias Model 
  = Bool


init : Model
init =
  False


-- UPDATE


type Msg
  = Toogle


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Toogle ->
      (not model, Cmd.none)


-- VIEW


view : Model -> Html Msg
view model =
  div 
    []
    [ div [] [ button [ onClick Toogle ] [ text "Help" ] ]
    , div [ countStyle ] <| if model then [ text "You need help with this? Seriously?" ] else []
    ]


countStyle : Attribute msg
countStyle =
  style
    [ ("font-size", "16px")
    , ("font-family", "sans-serif")
    , ("display", "inline-block")
    , ("text-align", "center")
    , ("padding", "10px")
    , ("background-color", "beige")
    ]



-- Parts

type alias Help = 
  Model

help : Singleton { c | help : Help } Model Msg outerMsg
help =
  makeSingleton init view update .help (\c i -> { c | help = i })