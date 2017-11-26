;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    .emacs                                             :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bspindle <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/11/25 10:50:56 by bspindle          #+#    #+#              ;
;    Updated: 2017/11/26 19:22:36 by bspindle         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

(set-language-environment "UTF-8")
(global-set-key (kbd "TAB") 'self-insert-command)

(column-number-mode t)

(setq c-default-style "linux")

(setq backup-directory-alist `(("." . "~/.emacs.d")))

(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)

(defun insert-parentheses () "insert parentheses and go between them" (interactive)
  (insert "()")
  (backward-char 1))
(defun insert-brackets () "insert brackets and go between them" (interactive)
  (insert "[]")
  (backward-char 1))
(defun insert-braces () "insert curly braces and go between them" (interactive)
  (insert "{\n\n}")
  (backward-char 2))
(defun insert-quotes () "insert quotes and go between them" (interactive)
  (insert "\"\"")
  (backward-char 1))
(local-set-key "(" 'insert-parentheses)
(local-set-key "[" 'insert-brackets)
(local-set-key "{" 'insert-braces)
(local-set-key "\"" 'insert-quotes)

(add-hook 'c-mode-common-hook (lambda () (local-set-key "("  'insert-s)))
(add-hook 'c-mode-common-hook (lambda () (local-set-key "["  'insert-brackets)))
(add-hook 'c-mode-common-hook (lambda () (local-set-key "{"  'insert-braces)))
(add-hook 'c-mode-common-hook (lambda () (local-set-key "\""  'insert-quotes)))


;;;HEADER;;;
(defun ft_create_header ()
  "header maker function
  the header is make if there's not a valid header" (interactive)
  (goto-char -1)
  (insert "/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*  ")
(insert (file-name-nondirectory buffer-file-name))
(while (< (point) 300)
(insert " "))
(insert ":+:      :+:    :+:   */")
(insert "
/*                                                    +:+ +:+         +:+     */
/*   By: ")
(insert (getenv "USER"))
(insert " <")
(if (getenv "MAIL")
    (insert (getenv "MAIL")))
(if (getenv "MAIL") nil
    (insert "marvin@42.fr"))
(insert ">")
(while (< (point) 458)
	 (insert " "))
(insert "+#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: ")
(insert (format-time-string "%Y/%m/%d %H:%M:%S"))
(insert " by ")
(insert (getenv "USER"))
(while (< (point) 623)
	 (insert " "))
(insert "#+#    #+#             */
/*   Updated: ")
(insert (format-time-string "%Y/%m/%d %H:%M:%S"))
(insert " by ")
(insert (getenv "USER"))
(while (< (point) 703)
	 (insert " "))
 (insert "###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */")
)

(local-set-key (kbd "C-c h") 'ft_create_header)

(add-hook 'c-mode-common-hook (lambda () (local-set-key (kbd "C-c h")  'ft_create_header)))

(defun ft_update_header ()
      "function who update the hours and date of last changes"
  (if first-change-hook
	(goto-char 653)
	(delete-char 53)
	(insert (format-time-string "%Y/%m/%d %H:%M:%S"))
	(insert " by ")
	(insert (getenv "USER"))
	(while (< (point) 703)
		(insert " "))))

(add-hook 'c_commom-hook 'ft_update_header)


