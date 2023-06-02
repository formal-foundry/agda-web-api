{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}


module Compilation  where

import System.Process as SP
-- nnimport System.Console.ANSI
import System.Exit
import System.FilePath (splitFileName)
import System.Directory
import System.Environment (getEnv)

import Types

compile :: AgaType -> IO CompilerRes
compile at = undefined


tryToCompile ::  AgaType-> IO CompilerRes
tryToCompile at = do
  let fp = problem at
      (path, file) =  splitFileName fp
  aReq <- runProcess_ path file
  return $ CompilerRes { status = (fst aReq)
                       , output = (snd aReq) }

 
runProcess_ ::  FilePath -> String -> IO (Int, String)
runProcess_ pwd afile = do
  let cp = shell $ "agda" ++ " " ++ afile
      ncp = cp { cwd = Just pwd
               , std_out = CreatePipe
               , std_err = CreatePipe
               }
  (code, output, errorOutput) <- readCreateProcessWithExitCode ncp ""
  let result = case code of
                  ExitSuccess   -> (0, "Ok")
                  ExitFailure c -> (c,output) 
  return result
