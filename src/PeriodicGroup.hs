module PeriodicGroup (
  PeriodicGroup(..),
  groupOne,
  groupTwo,
  groupThree,
  groupFour,
  groupFive,
  groupSix,
  groupSeven,
  groupEight
) where

data PeriodicGroup = PeriodicGroup { mendeleevGrouping::String, basicName::String } deriving Eq

instance Show PeriodicGroup where
  show pg = mconcat [show $ basicName pg, show " (", show $ mendeleevGrouping pg , show ")"]

groupOne :: PeriodicGroup
groupOne = PeriodicGroup { mendeleevGrouping="I", basicName="Alkali Metals"}

groupTwo :: PeriodicGroup
groupTwo = PeriodicGroup { mendeleevGrouping="II", basicName="Alkali-earth Metals"}

groupThree :: PeriodicGroup
groupThree = PeriodicGroup { mendeleevGrouping="III", basicName=""}

groupFour :: PeriodicGroup
groupFour = PeriodicGroup { mendeleevGrouping="IV", basicName=""}

groupFive :: PeriodicGroup
groupFive = PeriodicGroup { mendeleevGrouping="V", basicName=""}

groupSix :: PeriodicGroup
groupSix = PeriodicGroup { mendeleevGrouping="VI", basicName=""}

groupSeven :: PeriodicGroup
groupSeven = PeriodicGroup { mendeleevGrouping="VII", basicName="Halogens"}

groupEight :: PeriodicGroup
groupEight = PeriodicGroup { mendeleevGrouping="VII", basicName="Noble Gases"}

