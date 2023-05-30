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
                , meta :: MetaD
                }  deriving (Show , Generic, ToJSON, FromJSON )



data MetaD = MetaD { agdaVersion :: String
                   , dependencies :: [String]
                   } deriving (Show , Generic, ToJSON, FromJSON )



data CompilerRes = CompilerRes { status :: Int
                               , err :: String
                               } deriving (Show , Generic, ToJSON, FromJSON )


data CheckRes = Ok AgaType | Err String

