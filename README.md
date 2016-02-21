# json-pointer.el [![travis badge][travis-badge]][travis-link]

JSON pointer implementation in Emacs Lisp. This is inspired by [JSON::Pointer](https://metacpan.org/pod/JSON::Pointer) and [Mojo::JSON::Pointer](http://mojolicious.org/perldoc/Mojo/JSON/Pointer)

## API

#### `(json-pointer-get json path)`

Get element by `path`. `json` is decoded object by `json.el`.

## Sample code

```lisp
(let ((json '((foo . 1)
              (bar . [((qux . "hello")) 3])
              (baz . ((boo . [1 3 5 7]))))))
    (json-pointer-get json "/foo")        ;; => 1
    (json-pointer-get json "/bar/0")      ;; =>  '((qux . "hello"))
    (json-pointer-get json "/bar/0/qux")  ;; => "hello"
    (json-pointer-get json "/bar/1")      ;; => 3
    (json-pointer-get json "/baz/boo/2")) ;; => 55
```

[travis-badge]: https://travis-ci.org/syohex/emacs-json-pointer.svg
[travis-link]: https://travis-ci.org/syohex/emacs-json-pointer
