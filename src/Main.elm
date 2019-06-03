module Main exposing (Msg(..), main)

{-| -}

import Browser
import Browser.Navigation
import Html
import Route
import Url exposing (Url)


main =
    Browser.application
        { init = init
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init () url navKey =
    ( { page = Route.fromUrl url
      , key = navKey
      }
    , Cmd.none
    )


subscriptions model =
    Sub.none


type alias Model =
    { page : Route.Route
    , key : Browser.Navigation.Key
    }


type Msg
    = ChangedUrl Url
    | ClickedLink Browser.UrlRequest


update msg model =
    case msg of
        ChangedUrl url ->
            let
                route =
                    Route.fromUrl url
            in
            ( { model | page = route }
            , Cmd.none
            )

        ClickedLink urlRequest ->
            ( model, Cmd.none )


view model =
    { title = "Mechanical Elephant"
    , body =
        [ Html.text "one byte at a time..."
        ]
    }
