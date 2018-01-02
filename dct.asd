;; -*- Mode: Lisp -*- 

(asdf:defsystem "dct"
  :name "dct"
  :description "Discrete cosine transform.."
  :version "1.0.0"
  :author "Ben Lambert <belambert@mac.com>"
  :license "Apache-4.0"
  :serial t
  :components
  ((:module src
    :serial t
    :components
    ((:file "package")
     (:file "dct"))))
  :depends-on (:alexandria))
