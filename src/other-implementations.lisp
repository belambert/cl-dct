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

(in-package :dct)

(defun dct-iii (array &optional truncated)
  "Discrete cosine transform (DCT). 
   DCT-III taken from:
   http://en.wikipedia.org/wiki/Discrete_cosine_transform#DCT-III
   Further multipling the X0 term by 1/√2 and multiply the resulting matrix by an overall scale factor of √(2/N)"
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (alexandria:coercef array 'vector)
  (let* ((N (length array))
	 (transformed (make-array N :element-type 'single-float :initial-element 0.0)))
    (dotimes (k (if truncated truncated N)) ;; only run this loop 'truncated' times if we're going to truncate the result anyway.
      (let* ((x_0 (aref array 0))
	     (X_k (/ x_0 2.0)) ;; do x_0 up front, not in the sum
	     (w_k (if (= k 0)
		      (/ 2.0 (sqrt N))
		      (sqrt (/ 2.0 N)))))
	(loop for little-n from 1 below N
	   for x_n = (aref array little-n)
	   for cos-term = (cos (* (/ pi N)
				  little-n
				  (+ k 0.5))) do
	     (incf X_k (* x_n cos-term)))
	(setf X_k (* X_k w_k))
	(alexandria:coercef X_k 'single-float)
	(setf (aref transformed k) X_k)))
    transformed))

(defun idct-ii (array)
  "The inverse of the Wikipedia DCT-II (defined in terms of DCT-III)."
  (let* ((N (length array))
	 (multiplier (/ 2.0 N))
	 (dct-iii (dct-iii array)))
    (map-into dct-iii (lambda (x) (* x multiplier)) dct-iii)))
