import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Type
  survivalFunction : Type
  censoringIndicator : Prop
  timeScale : Prop
  proportionalHazardsAssumption : Prop
  kaplanMeierEstimator : Prop
  coxModel : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringIndicatorClosed : S.censoringIndicator
  timeScaleClosed : S.timeScale
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxModelClosed : S.coxModel

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringIndicator ∧
  S.timeScale ∧ S.proportionalHazardsAssumption ∧
  S.kaplanMeierEstimator ∧ S.coxModel

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.censoringIndicatorClosed
        (And.intro E.timeScaleClosed
          (And.intro E.proportionalHazardsAssumptionClosed
            (And.intro E.kaplanMeierEstimatorClosed E.coxModelClosed)))))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse