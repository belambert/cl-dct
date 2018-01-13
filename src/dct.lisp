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

(defun dct (array &key truncated)
  "Discrete cosine transform (DCT). 
   DCT-II taken from:
   http://en.wikipedia.org/wiki/Discrete_cosine_transform#DCT-II
   Further multiplied the X0 term by 1/√2 and multiply the resulting matrix by an overall scale factor of √(2/N)  ...(?)"
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (alexandria:coercef array 'vector)
  (let* ((N (length array))
	 (transformed (make-array N :element-type 'single-float :initial-element 0.0)))
    (dotimes (k (if truncated truncated N)) ;; only run this loop 'truncated' times if we're going to truncate the result anyway.
      (let ((X_k 0.0)
	    ;; The 'norm' relation is largely(?) due to this scaling factor?
	    (w_k (if (= k 0)
		     (/ 1.0 (sqrt N))
		     (sqrt (/ 2.0 N)))))
	(loop for little-n from 0 below N
	   for x_n across array
	   for cos-term = (cos (* (/ pi N)
	   			  (+ little-n 0.5)
	   			  k)) do
	     (incf X_k (* x_n cos-term)))
	(setf X_k (* X_k w_k))
	(alexandria:coercef X_k 'single-float)
	(setf (aref transformed k) X_k)))
    transformed))


(defun idct (array)
  "Adapted from: http://www.mathworks.com/help/toolbox/signal/ref/idct.html"
  (alexandria:coercef array 'vector)
  (let* ((N (length array))
	 (transformed (make-array N :element-type 'single-float :initial-element 0.0)))
    (dotimes (little-n N)
      (let* ((x_n 0.0))
	(loop for k from 1 to N
	   ;;for y_k = (aref array (1- k))
	   for y_k across array
	   for cos-term = (cos (/ (* pi
				     (- (* 2 (1+ little-n)) 1)
				     (- k 1))
				  (* 2 N)))
	   for w_k = (if (= k 1)
			 (/ 1.0 (sqrt N))
			 (sqrt (/ 2.0 N))) do
	     (incf x_n (* w_k y_k cos-term)))
	(alexandria:coercef x_n 'single-float)
	(setf (aref transformed little-n) x_n)))
    transformed))
