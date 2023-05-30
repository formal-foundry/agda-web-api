{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

module Extra where

import Types

import Web.Scotty
import qualified Network.Wai.Parse as NWP

import Data.Text as T
import Data.Text.Lazy as TL


import qualified Data.ByteString.Lazy.Internal as BL
import qualified Data.ByteString.Char8 as BC

checkFiles :: [File] -> CheckRes
checkFiles fl = case Prelude.length fl of
  _ -> Err "de"
  
