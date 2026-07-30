import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure SurvivalModelPackage where
  hazardFunction : Type u
  survivalFunction : Type v
  censoringIndicator : Prop
  proportionalHazardsAssumption : Prop
  kaplanMeierEstimator : Prop

structure SurvivalModelEvidence (S : SurvivalModelPackage) where
  hazardFunctionDefined : Nonempty S.hazardFunction
  survivalFunctionDefined : Nonempty S.survivalFunction
  censoringIndicatorClosed : S.censoringIndicator
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator

def SurvivalModelClosed (S : SurvivalModelPackage) : Prop :=
  Nonempty S.hazardFunction ∧ Nonempty S.survivalFunction ∧
  S.censoringIndicator ∧ S.proportionalHazardsAssumption ∧ S.kaplanMeierEstimator

theorem survival_model_closed_from_evidence (S : SurvivalModelPackage)
    (E : SurvivalModelEvidence S) : SurvivalModelClosed S := by
  exact And.intro E.hazardFunctionDefined
    (And.intro E.survivalFunctionDefined
      (And.intro E.censoringIndicatorClosed
        (And.intro E.proportionalHazardsAssumptionClosed E.kaplanMeierEstimatorClosed)))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
