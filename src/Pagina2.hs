{-# LANGUAGE QuasiQuotes #-}

module Pagina2 where

import Foundation
import Yesod.Core


getPagina2R :: Int -> Handler Html
getPagina2R numeroInteiro = do
    defaultLayout 
        [whamlet| 
            <h1>
                Bem vindo à Pagina 2
            <p>
                O número passado por parâmetro na requisição foi: #{numeroInteiro}
            <p>
                O número passado incrementado com + 1: #{valorIncrementado}
        $if (even numeroInteiro) 
            <p>
                O número passado é um número par
        $else
            <p>
                O número passado é um número ímpar
        
        |]
    where 
        valorIncrementado = numeroInteiro + 1