(in-package :cl-user)

#+(or) ;; 
(in-package :jss)

(defparameter expanded '(let ((jss::this jss::*object-for-this*))
      (jcall "getLoaded"
	     (jcall "load"
		    (jcall "make"
			   (jcall "intercept"
				  (jcall "method"
					 (jcall "subclass"
						(new '|ByteBuddy|)
						(find-java-class '|Object|)
						t)
					 (jstatic "named"
						  '|ElementMatchers|
						  "toString"))
				  (jstatic "value"
					   '|FixedValue|
					   "Hello World!")))
		    (jcall "getClassLoader"
			   (jcall "getClass" jss::this))))))

(defparameter source '#1"new ByteBuddy().subclass(Object.class,t)
   .method(ElementMatchers.named("toString"))
   .intercept(FixedValue.value("Hello World!"))
   .make()
   .load(getClass().getClassLoader())
   .getLoaded()" )

(in-package :jss-test)

(prove:plan 1)
(proveis jss::source
    jss::expanded)

(prove:finalize)
