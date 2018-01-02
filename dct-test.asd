;; -*- Mode: Lisp -*- 

(asdf:defsystem "dct-test"
  :name "dct-test"
  :description "Discrete cosine transform tests."
  :version "1.0.0"
  :author "Ben Lambert <belambert@mac.com>"
  :license "Apache-2.0"
  :serial t
  :components
  ((:module src
    :serial t
    :components
    ((:file "test"))))
  :depends-on ("dct"
	       "lisp-unit"
	       ;; cl-coverage is failing without these
	       "trivial-features"
	       "babel"
	       "cl-coveralls"))
