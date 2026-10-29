cl-dct
======
[![test](https://github.com/belambert/cl-dct/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/belambert/cl-dct/actions/workflows/test.yml)

[Discrete cosine transform (DCT)](https://en.wikipedia.org/wiki/Discrete_cosine_transform) 
is a signal processing algorithm that compresses a signal.  It's
similar to a Fourier transform. DCT is often used in speech recognition for
computing MFCC features.

There are a number of different versions and implementations of
DCT. This implementation mimics the one in Matlab. You should also get
the same results in [scipy](https://www.scipy.org/) with the command:

```python
scipy.fftpack.dct([4., 3., 5., 10.], norm='ortho')
```

The `idct()` implementation is equivalent to the Matlab implementation
and the scipy command:

```python
scipy.fftpack.idct([4., 3., 5., 10.], norm='ortho')
```

This is an O(n²) implementation. [O(n log(n))
implementations](https://www.nayuki.io/page/fast-discrete-cosine-transform-algorithms)
are also possible.

## Testing

Tests use [lisp-unit](https://github.com/OdonataResearchLLC/lisp-unit) and run via ASDF:

    (asdf:test-system :dct)

## TODO

- Add install and usage docs: `(ql:quickload :dct)`, an example, and the
  `:truncated` keyword (returns only the first N coefficients).
- Return `double-float` (or make it an option). Results are currently
  `single-float`, so they match Matlab and scipy only to about 7 digits.
- Test on more implementations (ABCL, CCL, ECL) in CI. The code should now
  load outside SBCL, but that is untested.
- Add an O(n log(n)) algorithm; this one is O(n²), which matters when
  computing MFCCs over many frames.
- Check the expected test values against real scipy or Matlab output. They
  were checked only against a hand-written reference.
- Reword the intro: DCT is a transform often used for compression, not a
  compression algorithm itself.
