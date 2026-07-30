import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticTestEvaluationPackage where
  sensitivity : ℝ
  specificity : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  diseasePrevalence : ℝ
  prevalenceKnown : Prop
  testAccuracyEstablished : Prop

structure DiagnosticTestEvaluationEvidence (D : DiagnosticTestEvaluationPackage) where
  prevalenceKnownClosed : D.prevalenceKnown
  testAccuracyEstablishedClosed : D.testAccuracyEstablished

def DiagnosticTestEvaluationClosed (D : DiagnosticTestEvaluationPackage) : Prop :=
  D.prevalenceKnown ∧ D.testAccuracyEstablished

theorem diagnostic_test_evaluation_closed_from_evidence (D : DiagnosticTestEvaluationPackage) (Ev : DiagnosticTestEvaluationEvidence D) : DiagnosticTestEvaluationClosed D :=
  And.intro Ev.prevalenceKnownClosed Ev.testAccuracyEstablishedClosed

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse