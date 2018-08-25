{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Minimal Multifile"
    let listaNumeros = [1..10]
    [whamlet|   
        <p>
            <a href=@{Pagina2R 4}> Acessar página 2
        <p>
            <a href=/pagia1> Acessar página 1, sem interpolador de rota
        <p>
            <a href=@{Pagina1R}> Acessar página 1, com interpolador de rota
        <p>
            <a href=@{AddR 5 7}>HTML addition
        <p>
            <a href=@{AddR 5 7}?_accept=application/json>JSON addition
    |]
    [whamlet| 
        <h1> Links com valores a serem enviados para a página 2
        
        <ul>
        $forall numero <- listaNumeros
            <li>
                <a href=@{Pagina2R numero}>
                    Ir para a pagina2 com o valor: #{numero}
    |]
    
postHomeR :: Handler Html
postHomeR = error "rota não implementada"
