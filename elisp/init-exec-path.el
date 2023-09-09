;;; init-exec-path.el -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :config
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO"
                 "LANG" "LC_CTYPE" "NIX_SSL_CERT_FILE" "NIX_PATH"
                 "TEXMFHOME" "HOMEBREW_PREFIX"))
    (add-to-list 'exec-path-from-shell-variables var))
  (when (or (memq window-system '(mac ns x pgtk))
            (unless (memq system-type '(ms-dos windows-nt))
              (daemonp)))
    (exec-path-from-shell-initialize)))

(provide 'init-exec-path)
