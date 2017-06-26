;; Tema                                                                                                                                                                   
                                                                                                                                                                          
(load-theme 'wheatgrass t)                                                                                                                                                
                                                                                                                                                                          
                                                                                                                                                                          
;; Ajustando el ISO                                                                                                                                                       
(require 'iso-transl)                                                                                                                                                     
                                                                                                                                                                          
(setq prelude-guru nil)                                                                                                                                                   
                                                                                                                                                                          
;; Fuente                                                                                                                                                                 
(set-frame-font "Inconsolata-10")                                                                                                                                         
                                                                                                                                                                          
;; Org-mode                                                                                                                                                               
(add-to-list 'load-path "~/software/org-mode/lisp")                                                                                                                       
(add-to-list 'load-path "~/software/org-mode/contrib/lisp" t)                                                                                                             
                                                                                                                                                                          
(require 'org-list)                                                                                                                                                       
                                                                                                                                                                          
(require 'ox-reveal)                                                                                                                                                      
                                                                                                                                                                          
(setq org-reveal-root "file:///home/nano/software/reveal.js-2.6.1/")                                                                                                      
                                                                                                                                                                          
;; Org-babel                                                                                                                                                              
;; load all language marked with (lang . t).                                                                                                                              
(org-babel-do-load-languages                                                                                                                                              
 'org-babel-load-languages                                                                                                                                                
 '(                                                                                                                                                                       
   (C . t)                                                                                                                                                                
   (R . t)                                                                                                                                                                
   (asymptote)                                                                                                                                                            
   (awk . t)                                                                                                                                                              
   (calc . t)                                                                                                                                                             
   (clojure)                                                                                                                                                              
   (comint)                                                                                                                                                               
   (css . t)                                                                                                                                                              
   (ditaa . t)                                                                                                                                                            
   (dot . t)                                                                                                                                                              
   (emacs-lisp . t)                                                                                                                                                       
   (fortran)                                                                                                                                                              
   (gnuplot . t)                                                                                                                                                          
   (haskell)                           
   (haskell)                                                                                                                                                              
   (io)                                                                                                                                                                   
   (java)                                                                                                                                                                 
   (js)                                                                                                                                                                   
   (latex . t)                                                                                                                                                            
   (ledger)                                                                                                                                                               
   (lilypond)                                                                                                                                                             
   (lisp . t)                                                                                                                                                             
   (matlab . t)                                                                                                                                                           
   (maxima . t)                                                                                                                                                           
   (mscgen)                                                                                                                                                               
   (ocaml)                                                                                                                                                                
   (octave . t)                                                                                                                                                           
   (org . t)                                                                                                                                                              
   (perl)                                                                                                                                                                 
   (picolisp)                                                                                                                                                             
   (plantuml . t)                                                                                                                                                         
   (python . t)                                                                                                                                                           
   (ref)                                                                                                                                                                  
   (ruby . t)                                                                                                                                                             
   (sass . t)                                                                                                                                                             
   (scala)                                                                                                                                                                
   (scheme)                                                                                                                                                               
   (screen)                                                                                                                                                               
   (sh . t)                                                                                                                                                               
   (shen)                                                                                                                                                                 
   (sql . t)                                                                                                                                                              
   (sqlite . t)                                                                                                                                                           
   )                                                                                                                                                                      
 )                                                                                                                                                                        
                                                                                                                                                                          
                                                                                                                                                                          
;; ido-mode                                                                                                                                                               
(require 'ido)                                                                                                                                                            
(ido-mode t)                                                                                                                                                              
                                                                                                                                                                            
;; ag                                                                                                                                                                     
;; Usa silver-searcher (https://github.com/ggreer/the_silver_searcher) en lugar de usar grep                                                                              
;; https://github.com/Wilfred/ag.el#screenshot                                                                                                                            
                                                                                                                                                                          
(setq ag-highlight-search t) ;; highlighting results                     

                                                                                                                                                                         
                                                                                                                                                                          
;; wgrep                                                                                                                                                                  
;; wgrep allows you to edit a grep buffer and apply those changes to the file buf                                                                                         
;; https://github.com/mhayashi1120/Emacs-wgrep                                                                                                                            
(require 'wgrep)                                                                                                                                                          
                                                                                                                                                                          
                                                                                                                                                                          
;; enh-ruby-mode                                                                                                                                                          
;; La siguiente configuración fue tomada de https://gist.github.com/gnufied/7160799                                                                                       
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)                                                                                                   
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))                                                                                                                
(add-to-list 'auto-mode-alist '("\\.cap$" . enh-ruby-mode))                                                                                                               
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))                                                                                                              
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))                                                                                                             
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))                                                                                                           
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))                                                                                                                
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))                                                                                                              
                                                                                                                                                                          
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))                                                                                                           
                                                                                                                                                                          
(setq enh-ruby-bounce-deep-indent t)                                                                                                                                      
(setq enh-ruby-hanging-brace-indent-level 2)                                                                                                                              
                                                                                                                                                                          
(require 'cl) ; If you don't have it already                                                                                                                              
                                                                                                                                                                          
(defun* get-closest-gemfile-root (&optional (file "Gemfile"))                                                                                                             
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.                                                                 
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name                                                           
of FILE in the current directory, suitable for creation"                                                                                                                  
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly                                                                                 
    (loop                                                                                                                                                                 
     for d = default-directory then (expand-file-name ".." d)                                                                                                             
     if (file-exists-p (expand-file-name file d))                                                                                                                         
     return d                                                                                                                                                             
     if (equal d root)     
     (require 'compile)                                                                                                                                                        
                                                                                                                                                                          
(defun rspec-compile-file ()                                                                                                                                              
  (interactive)                                                                                                                                                           
  (compile (format "cd %s;bundle exec rspec %s"                                                                                                                           
                   (get-closest-gemfile-root)                                                                                                                             
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))                                                                                     
                   ) t))                                                                                                                                                  
                                                                                                                                                                          
(defun rspec-compile-on-line ()                                                                                                                                           
  (interactive)                                                                                                                                                           
  (compile (format "cd %s;bundle exec rspec %s -l %s"                                                                                                                     
                   (get-closest-gemfile-root)                                                                                                                             
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))                                                                                     
                   (line-number-at-pos)                                                                                                                                   
                   ) t))                                                                                                                                                  
                                                                                                                                                                          
(add-hook 'enh-ruby-mode-hook                                                                                                                                             
          (lambda ()                                                                                                                                                      
            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)                                                                                                          
            (local-set-key (kbd "C-c k") 'rspec-compile-file)                                                                                                             
            ))                                                                                                                                                            
                                                                                                                                                                          
                                                                                                                                                                          
;(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)                                                                                                                      
;/home/nano/.rvm/rubies/ruby-2.0.0-p247/bin/ruby                                                                                                                          
                                                                                                                                                                          
(setq enh-ruby-program "/home/nano/.rbenv/versions/2.1.2/bin/ruby")                                                                                                       
                                                                                                                                                                          
                                                                                                                                                                          
                                                                                                                                                                          
;; Robe                                                                                                                                                                   
;; (add-hook 'enh-ruby-mode-hook 'robe-mode)                                                                                                                              
                                                                                                                                                                          
(provide 'nano)                                                     
