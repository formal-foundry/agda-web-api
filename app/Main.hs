{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}

module Main where

import Types

import Web.Scotty
import Data.Text
-- import Data.Monoid (mconcat)

main :: IO ()
main = scotty 3000 $
 post "/agda" $ do
   incoming  <- jsonData :: (ActionM AgaType)
   text $ "agda res api test" 


