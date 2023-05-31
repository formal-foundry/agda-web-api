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

import Network.HTTP.Types.Status

import Web.Scotty
import qualified Network.Wai.Parse as NWP


mainAPI :: ATCEnv -> IO ()
mainAPI env =do
  putStrLn "ce"
  scotty (port env) $ do

    get "/" $  text  $ TL.fromStrict info


    post "/agda" $ do
      incoming  <- files
      rcf <- liftIO $ checkAndPrepareFiles incoming env
      case rcf of
        Ok x ->  text $ "response here"
        Err x ->  raiseStatus status400 $ TL.pack x


main :: IO ()
main = loadConfigAndRun mainAPI


info :: T.Text
info =  [NI.text|
EXAMPLE OF USAGE
text 
or HTML |]
