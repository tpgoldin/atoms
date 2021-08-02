module IonSpec where

import Test.Hspec

import Ion
import Proton
import Electron
import ChemicalElements

spec :: Spec
spec = do
  describe "Cation" $ do
    it "An atom losing an electron creates a cation" $ do
      let na = sodium
      let actual = na `loseElectrons` 1

      cationChemicalElement actual `shouldBe` na
      protons actual `shouldBe` [proton]

  describe "Anion" $ do
    it "An atom gaining an electron creates an anion" $ do
      let o = oxygen
      let actual = o `gainElectrons` 2

      anionChemicalElement actual `shouldBe` o
      electrons actual `shouldBe` [electron, electron]
