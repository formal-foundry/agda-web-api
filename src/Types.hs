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


import Data.Text as T
import Data.Text.Lazy as TL


data AgaType = AgaType
                { problem :: FilePath
                , meta :: MetaD
                }  deriving (Show , Generic, ToJSON, FromJSON )



data MetaD = MetaD { agdaVersion :: String
                   , dependencies :: [String]
                   } deriving (Show , Generic, ToJSON, FromJSON )



data CompilerRes = CompilerRes { status :: Int
                               , err :: String
                               } deriving (Show , Generic, ToJSON, FromJSON )


data CheckRes = Ok AgaType | Err String


data ATCEnv =
  ATCEnv 
  { port :: Int
  , tlsOn :: Bool
  , tlsKey :: String
  , tlsCert :: String
  , agdaExec :: FilePath
  } deriving (Show , Generic, ToJSON, FromJSON )

