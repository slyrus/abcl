(in-package :cl-user)

(let ((set (list 2 3 5 7 11)))
  (prove:plan 2)
  (prove:is-type (jss:to-hashset set)
                 'java:java-object
                 "Checking whether JSS:TO-HASHSET produces a Java object…")
  (prove:ok (jss:jmap 'constantly
                      (java:jnew-array "java.lang.Integer" 10))
            "Checking JSS:MAP on Java array of java.lang.Integer…"))

(prove:finalize)

