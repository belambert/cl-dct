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
  :depends-on (:dct :lisp-unit)
  :perform (test-op (op c)
             (let ((r (uiop:symbol-call :lisp-unit :run-tests :all :dct-test)))
               (when (or (uiop:symbol-call :lisp-unit :failed-tests r)
                         (uiop:symbol-call :lisp-unit :error-tests r))
                 (error "Tests failed.")))))
