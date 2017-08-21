module SeatSaver exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    List Seat


type alias Seat =
    { seatNo : Int
    , occupied : Bool
    }


initModel : List Seat
initModel =
    [ { seatNo = 1, occupied = False }
    , { seatNo = 2, occupied = False }
    , { seatNo = 3, occupied = False }
    , { seatNo = 4, occupied = False }
    , { seatNo = 5, occupied = False }
    , { seatNo = 6, occupied = False }
    , { seatNo = 7, occupied = False }
    , { seatNo = 8, occupied = False }
    , { seatNo = 9, occupied = False }
    , { seatNo = 10, occupied = False }
    , { seatNo = 11, occupied = False }
    , { seatNo = 12, occupied = False }
    ]



-- UPDATE


type Msg
    = Toggle Seat


update : Msg -> Model -> Model
update msg seats =
    case msg of
        Toggle selectedSeat ->
            Debug.log "state: "
                (updateSeat seats selectedSeat)


updateSeat : Model -> Seat -> Model
updateSeat seats selectedSeat =
    List.map
        (\seat ->
            if seat.seatNo == selectedSeat.seatNo then
                { seat | occupied = not seat.occupied }
            else
                seat
        )
        seats



-- VIEW


view : Model -> Html Msg
view model =
    ul [ class "seats" ] (List.map seatItem model)


seatItem : Seat -> Html Msg
seatItem seat =
    if seat.occupied then
        li [ class "seat occupied", onClick (Toggle seat) ] [ text (toString seat.seatNo) ]
    else
        li [ class "seat available", onClick (Toggle seat) ] [ text (toString seat.seatNo) ]


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
