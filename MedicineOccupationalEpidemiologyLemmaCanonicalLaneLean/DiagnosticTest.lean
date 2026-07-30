import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  likelihoodRatioPositive : ℝ
  likelihoodRatioNegative : ℝ
  diagnosticAccuracy : Prop
  clinicalUtility : Prop

def DiagnosticTestClosed (D : DiagnosticTest) : Prop :=
  D.diagnosticAccuracy ∧ D.clinicalUtility

structure DiagnosticTestEvidence (D : DiagnosticTest) where
  diagnosticAccuracyClosed : D.diagnosticAccuracy
  clinicalUtilityClosed : D.clinicalUtility

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTest) (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.diagnosticAccuracyClosed E.clinicalUtilityClosed

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse