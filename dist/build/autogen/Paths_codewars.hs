{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_codewars (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/marespinosa/.cabal/bin"
libdir     = "/Users/marespinosa/.cabal/lib/x86_64-osx-ghc-8.0.1/codewars-0.1.0.0-1LvEG7nC1LV3rfELbZPSEB"
datadir    = "/Users/marespinosa/.cabal/share/x86_64-osx-ghc-8.0.1/codewars-0.1.0.0"
libexecdir = "/Users/marespinosa/.cabal/libexec"
sysconfdir = "/Users/marespinosa/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "codewars_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "codewars_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "codewars_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "codewars_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "codewars_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
