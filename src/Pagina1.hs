{-# LANGUAGE QuasiQuotes #-}
module Pagina1 where

import Foundation
import Yesod.Core

data Pessoa = Pessoa {pessoaNome::String, pessoaIdade::Int}

getPagina1R :: Handler Html
getPagina1R = do
    let pessoa = Pessoa "Felipe" 32
    let rodapeClass = "rodapeclass"
    let corDoRodape = "red"
    defaultLayout $ do 
        toWidget 
            [hamlet|
            <h1> Livraria
            <p> Iniciando o projeto da livraria com Yesod.
            <h2> Linguagens de programação
            <ul #livrosID name=livros >
                <li #javaID> Java 8
                <li #haskellID> Haskell
                <li #cID> C #
                <li #clojureID> Clojure
            |]
        toWidget
            [hamlet| 
                <a href=@{HomeR}>
                    Voltar a página inicial
            |]
        toWidget
            [hamlet|
                <footer .#{rodapeClass} onclick=emitirMensagemRodape() > Página feita por: #{pessoaNome pessoa}. #{pessoaIdade pessoa} de idade.
            |]
        toWidget 
            [julius| 
               function emitirMensagemRodape(){
                   alert("Você clicou no rodapé")
               }
            |]
        toWidget
            [lucius| 
                @cortitulo: green;
                h1 { color : #{cortitulo} }
                .#{rodapeClass} {color : #{corDoRodape} }
            |]
    