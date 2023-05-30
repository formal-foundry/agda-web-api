{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}

module Main where

import Types
import Extra

import qualified NeatInterpolation as NI(text)

import Data.Text.Lazy
import Control.Monad.IO.Class (liftIO)


import Data.Text as T
import Data.Text.Lazy as TL


import Web.Scotty
import qualified Network.Wai.Parse as NWP


main :: IO ()
main = scotty 3000 $ do

 post "/compile/agda" $ do
   incoming  <- files
   let rcf = checkFiles incoming
   case rcf of
     Ok x ->  text $ "response here"
     Err x -> html $ "response here"



 get "/" $  text  $ TL.fromStrict info


info :: T.Text
info =  [NI.text|
EXAMPLE OF USAGE
Multilien text
or HTML |]
