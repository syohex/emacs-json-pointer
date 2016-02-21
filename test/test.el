;;; test.el --- Test for json-pointer.el

;; Copyright (C) 2016 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'ert)
(require 'json)
(require 'json-pointer)

(ert-deftest get ()
  "'get' test"
  (let ((json '((foo . "bar") (baz . [4 5]))))
    (should (string= (json-pointer-get json "/foo") "bar"))
    (should (= (json-pointer-get json "/baz/1") 5))
    
    (should-not (json-pointer-get json "bar"))
    (should-not (json-pointer-get json "/baz/9")))

  (let ((json '((foo . 1)
                (bar . [((qux . "hello")) 3])
                (baz . ((boo . [1 3 5 7]))))))
    (should (= (json-pointer-get json "/foo") 1))
    (should (equal (json-pointer-get json "/bar/0") '((qux . "hello"))))
    (should (string= (json-pointer-get json "/bar/0/qux") "hello"))
    (should (= (json-pointer-get json "/bar/1") 3))
    (should (= (json-pointer-get json "/baz/boo/2") 5))))

;;; test.el ends here
