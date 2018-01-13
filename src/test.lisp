;; Copyright 2010-2018 Ben Lambert

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at

;;     http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;; To run these tests: (lisp-unit:run-tests :all :dct-test)

(defpackage :dct-test
  (:use :common-lisp
	:cl-user
        :dct
        :lisp-unit)
  (:export :run))

(in-package :dct-test)

(define-test test-dct-basic

  (assert-true (equalp
		(dct #(4 3 5 10))
		#(11.0 -4.460885 3.0 -0.31702533)))

  (assert-true (equalp
		(idct #(11.0 -4.460885 3.0 -0.31702533))
		#(4 3 5 10)))

  (assert-true (equalp
		(dct #(0 0 0 0))
		#(0 0 0 0)))

  (assert-true (equalp
		(idct #(0 0 0 0))
		#(0 0 0 0)))

  (assert-true (equalp
		(dct #(1 1 1 1))
		#(2.0 7.850462e-17 -7.850462e-17 -1.5700924e-16)))  ;; should be [ 2.,  0.,  0.,  0.]?

  (assert-true (equalp
		(idct #(1 1 1 1))
		#(1.9238795 -0.38268343 0.38268343 0.07612047)))

  (assert-true (equalp
		(dct #(-1 -1 -1 -1))
		#(-2.0 -7.850462e-17 7.850462e-17 1.5700924e-16)))  ;; should be [ 2.,  0.,  0.,  0.]?

  (assert-true (equalp
		(idct #(-1 -1 -1 -1))
		#(-1.9238795 0.38268343 -0.38268343 -0.07612047)))

  (assert-true (equalp
		(dct #(2))
		#(2.0)))

  (assert-true (equalp
		(idct #(2))
		#(2.0)))

  (assert-true (equalp
		(dct #(2000000000000000000000 20000000000000000000000000000000  40000000000000000000000000000000000000))
		#(2.3094023e37 -2.8284271e37 1.6329916e37))))
