{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}


module Types where

import GHC.Generics
import Data.Aeson
import Data.Aeson.Text

data AgaType = AgaType 
                { problem :: String
                , goal :: String
                , meta :: String 
                }  deriving (Show , Generic, ToJSON, FromJSON )


