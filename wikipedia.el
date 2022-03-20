;;; /code/emacs-present/wikipedia.el -*- lexical-binding: t; -*-

(defun fetch-wikipedia-results (search-term)
  (url-retrieve-synchronously
   (format "https://wikipedia.org/w/api.php?format=json&action=query&list=search&srsearch=%s" (url-encode-url search-term))))

(defconst json (with-current-buffer (fetch-wikipedia-results "Universe")
  (goto-char url-http-end-of-headers)
  (json-read)))
