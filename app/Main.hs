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
import Compilation

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
        Ok x ->  do
                   c <- liftIO $ compile x
                   json c
        Err x ->  raiseStatus status400 $ TL.pack x


main :: IO ()
main = loadConfigAndRun mainAPI


info :: T.Text
info =  [NI.text|
EXAMPLE OF USAGE
text 
or HTML |]


-- tryToCompile :: String -> IO (Maybe String)
-- tryToCompile fp = do
--   let (path, file) =  splitFileName fp
--   aReq <- runProcess_ path file
--   p  <- getEnv "PWD"
--   case aReq of
--     Nothing -> return Nothing
--     Just re -> do
--                 return $ Just $ replaceStringLoop (p++"/") "" re
      
-- runProcess_ ::  FilePath -> String -> IO (Maybe String)
-- runProcess_ pwd afile = do
--   let cp = shell $ "agda" ++ " " ++ afile
--       ncp = cp { cwd = Just pwd
--                , std_out = CreatePipe
--                , std_err = CreatePipe
--                }            
--   (code, output, errorOutput) <- readCreateProcessWithExitCode ncp ""
--   let result = case code of
--                   ExitSuccess   -> Nothing
--                   ExitFailure _ -> Just output
--   return result
