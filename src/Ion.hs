module Ion (
  Ion(..),
  ElectronGainer(..),
  electronGainer,
  ElectronLoser(..),
  electronLoser,
  loseElectrons,
  gainElectrons
) where

import IonRatios
import ElectronGainer
import ElectronLoser

data Ion = Cation { catElectronLoser::ElectronLoser, catRatio::IonRatio } |
           Anion { anElectronGainer::ElectronGainer, anRatio::IonRatio } deriving Eq

instance Show Ion where
  show Cation { catElectronLoser=cel, catRatio=r } = mconcat [show cel, show r]
  show Anion { anElectronGainer=aeg, anRatio=r } = mconcat [show aeg, show r]

loseElectrons :: ElectronLoser -> Int -> Ion
loseElectrons el n = Cation { catElectronLoser=el, catRatio=cationRatio n }

gainElectrons :: ElectronGainer -> Int -> Ion
gainElectrons eg n = Anion { anElectronGainer=eg, anRatio=anionRatio n }