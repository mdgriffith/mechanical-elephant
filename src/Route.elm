module Route exposing (Route(..), fromUrl, parser)

import Url exposing (Url)
import Url.Parser


type Route
    = Home
    | About
    | Unknown


fromUrl : Url -> Route
fromUrl url =
    Url.Parser.parse parser url
        |> Maybe.withDefault Unknown


parser : Url.Parser.Parser (Route -> a) a
parser =
    Url.Parser.oneOf
        [ Url.Parser.map Home Url.Parser.top
        , Url.Parser.map About (Url.Parser.s "about")
        ]
