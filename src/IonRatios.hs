module IonRatios (
  IonRatio(..),
  cationRatio,
  anionRatio
) where

import Electron
import Proton

data IonRatio = CationRatio { theProton::Proton, pRatio::Int } | AnionRatio { theElectron::Electron, eRatio::Int } deriving Eq

instance Show IonRatio where
  show CationRatio { theProton=_, pRatio=r } = mconcat [show r, "+"]
  show AnionRatio { theElectron=_, eRatio=r } = mconcat [show r, "-"]

cationRatio :: Int -> IonRatio
cationRatio n = CationRatio { theProton=proton, pRatio=n }

anionRatio :: Int -> IonRatio
anionRatio n = AnionRatio { theElectron=electron, eRatio=n }