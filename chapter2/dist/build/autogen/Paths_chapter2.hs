module Paths_chapter2 (
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
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/ruiperes/Library/Haskell/ghc-7.8.3/lib/chapter2-0.0.1/bin"
libdir     = "/Users/ruiperes/Library/Haskell/ghc-7.8.3/lib/chapter2-0.0.1/lib"
datadir    = "/Users/ruiperes/Library/Haskell/ghc-7.8.3/lib/chapter2-0.0.1/share"
libexecdir = "/Users/ruiperes/Library/Haskell/ghc-7.8.3/lib/chapter2-0.0.1/libexec"
sysconfdir = "/Users/ruiperes/Library/Haskell/ghc-7.8.3/lib/chapter2-0.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "chapter2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "chapter2_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "chapter2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "chapter2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "chapter2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
