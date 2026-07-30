import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : ℚ
  specificity : ℚ
  prevalence : ℚ
  positivePredictiveValue : ℚ
  negativePredictiveValue : ℚ
  testAccuracyValid : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  sensitivityInRange : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityInRange : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  prevalenceInRange : 0 ≤ D.prevalence ∧ D.prevalence ≤ 1
  positivePredictiveValueClosed : D.positivePredictiveValue = (D.sensitivity * D.prevalence) / (D.sensitivity * D.prevalence + (1 - D.specificity) * (1 - D.prevalence))
  negativePredictiveValueClosed : D.negativePredictiveValue = (D.specificity * (1 - D.prevalence)) / ((1 - D.sensitivity) * D.prevalence + D.specificity * (1 - D.prevalence))
  testAccuracyValidClosed : D.testAccuracyValid

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  (0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1) ∧
  (0 ≤ D.specificity ∧ D.specificity ≤ 1) ∧
  (0 ≤ D.prevalence ∧ D.prevalence ≤ 1) ∧
  D.positivePredictiveValue = (D.sensitivity * D.prevalence) / (D.sensitivity * D.prevalence + (1 - D.specificity) * (1 - D.prevalence)) ∧
  D.negativePredictiveValue = (D.specificity * (1 - D.prevalence)) / ((1 - D.sensitivity) * D.prevalence + D.specificity * (1 - D.prevalence)) ∧
  D.testAccuracyValid

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.sensitivityInRange
    (And.intro E.specificityInRange
      (And.intro E.prevalenceInRange
        (And.intro E.positivePredictiveValueClosed
          (And.intro E.negativePredictiveValueClosed E.testAccuracyValidClosed))))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
