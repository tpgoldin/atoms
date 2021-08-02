module IonSpec where

import Test.Hspec

import Ion
import IonRatios
import ChemicalElements

spec :: Spec
spec = do
  describe "Cation" $ do
    it "An atom losing an electron creates a cation" $ do
      let na = sodium
      let actual = electronLoser na `loseElectrons` 1

      catElectronLoser actual `shouldBe` electronLoser na
      catRatio actual `shouldBe` cationRatio 1

  describe "Anion" $ do
    it "An atom gaining an electron creates an anion" $ do
      let o = oxygen
      let actual = electronGainer o `gainElectrons` 2

      anElectronGainer actual `shouldBe` electronGainer o
      anRatio actual `shouldBe` anionRatio 2
