;; -*- mode: emacs-lisp -*-

(provide 'my)

(defun my/upcase-word ()
  "カーソルの位置にある単語を大文字に変換する"
  (interactive)
  (upcase-word -1)
  (upcase-word 1))

(defun my/downcase-word ()
  "カーソルの位置にある単語を小文字に変換する"
  (interactive)
  (downcase-word -1)
  (downcase-word 1))

(defun my/org-html-export-to-html ()
  "my/org-html-export-to-html"
  (interactive)
  (let* ((cwd default-directory)
         (relative-from-home (progn
                               (string-match user-home-directory cwd)
                               (replace-match "" nil nil cwd)))
         (document-root-dir ".own/docs/memoranda/")
         ;; rename-file でディレクトリ名として認識させるため末尾に'/'が必要
         (sub-dir (progn
                    (string-match document-root-dir relative-from-home)
                    (replace-match "" nil nil relative-from-home)))
         (html-dir "ksh2ksk4.github.io/"))
    (rename-file (org-html-export-to-html)
                 ;;todo このsub-dirが存在しない場合にディレクトリを作る
                 (concat user-home-directory document-root-dir html-dir sub-dir)
                 t)))

(defun my/org-md-export-to-markdown ()
  "my/org-md-export-to-markdown"
  (interactive)
  (let* ((cwd default-directory)
         (relative-from-home (progn
                               (string-match user-home-directory cwd)
                               (replace-match "" nil nil cwd)))
         (document-root-dir ".own/docs/memoranda/")
         ;; rename-file でディレクトリ名として認識させるため末尾に'/'が必要
         (sub-dir (progn
                    (string-match document-root-dir relative-from-home)
                    (replace-match "" nil nil relative-from-home)))
         (md-dir "ksh2ksk4.github.io/"))
    (rename-file (org-md-export-to-markdown)
                 (concat user-home-directory document-root-dir md-dir sub-dir)
                 t)))
