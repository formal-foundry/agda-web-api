{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}


module Compilation  where

import Types

compile :: AgaType -> IO CompilerRes
compile at = undefined


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
