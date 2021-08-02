module ChemicalReactionSpec where

import Test.Hspec

import Molecule
import Compound
import ElementsRatios
import Molecules
import PhysicalState
import ChemicalReactant
import ChemicalProduct
import ChemicalReaction
import ChemicalElements

import qualified Data.Map as M

spec::Spec
spec = do
  describe "Chemical reactant" $ do
    it "chemical reactant mapping" $ do
      let co2 = molecularCompound carbonDioxide

      let cr = chemicalReactant 2 co2 Gas
      let actual = chemicalReactantCompoundMapping cr

      actual `shouldBe` M.fromList [(carbon, 2), (oxygen, 4)]

  describe "Chemical product" $ do
    it "chemical product mapping" $ do
      let h2o = molecularCompound water

      let cp = chemicalProduct 2 h2o Liquid
      let actual = chemicalProductCompoundMapping cp

      actual `shouldBe` M.fromList [(hydrogen, 4), (oxygen, 2)]

  describe "Chemical equation" $ do
    it "chemical equation balance" $ do
      let c2h6 = molecularCompound $ molecule [leafElementsRatios [elementRatio carbon 2, elementRatio hydrogen 6]]
      let o2 = molecularCompound $ molecule [leafElementsRatios [elementRatio oxygen 2]]

      let cr1 = chemicalReactant 2 c2h6 Gas
      let cr2 = chemicalReactant 7 o2 Gas

      let co2 = molecularCompound carbonDioxide
      let h2o = molecularCompound water

      let cp1 = chemicalProduct 4 co2 Gas
      let cp2 = chemicalProduct 6 h2o Liquid

      let ce = chemicalEquation [cr1, cr2] [cp1, cp2]

      show ce `shouldBe` ""

      isBalanced ce `shouldBe` True