module MoleculeSpec where

import Test.Hspec

import ElementsRatios
import Molecule
import ChemicalElements

import qualified Data.Map as M

spec :: Spec
spec = do
  describe "Molecule" $ do
    it "molecule element ratios" $ do
      let oh = leafElementsRatios [elementRatio oxygen 1, elementRatio hydrogen 1]
      let co = leafElementsRatios [elementRatio carbon 1, elementRatio oxygen 1]

      let cooh = compositeElementsRatios [co, oh]

      let ch3 = leafElementsRatios [elementRatio carbon 1, elementRatio hydrogen 3]

      let ch3cooh = compositeElementsRatios [ch3, cooh]
      
      let m1 = molecule [ch3cooh]

      moleculeElementRatioMapping m1 `shouldBe` M.fromList [(carbon, 2), (hydrogen, 4), (oxygen, 2)]
