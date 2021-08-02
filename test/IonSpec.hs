module IonSpec where

import Test.Hspec

import Ion
import Proton
import ChemicalElements

spec :: Spec
spec = do
  describe "Cation" $ do
    it "Losing an electron" $ do
      let na = sodium
      let x = cation na 1

      cationChemicalElement x `shouldBe` na
      protons x `shouldBe` [proton]
