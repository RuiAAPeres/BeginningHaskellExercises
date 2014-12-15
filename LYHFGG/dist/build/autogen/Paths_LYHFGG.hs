module Paths_LYHFGG (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ruiperes/Library/Haskell/bin"
libdir     = "/Users/ruiperes/Library/Haskell/ghc-7.8.3-x86_64/lib/LYHFGG-0.1.0.0"
datadir    = "/Users/ruiperes/Library/Haskell/share/ghc-7.8.3-x86_64/LYHFGG-0.1.0.0"
libexecdir = "/Users/ruiperes/Library/Haskell/libexec"
sysconfdir = "/Users/ruiperes/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "LYHFGG_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "LYHFGG_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "LYHFGG_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "LYHFGG_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "LYHFGG_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
