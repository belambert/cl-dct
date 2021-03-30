cl-dct
======
[![Build Status](https://travis-ci.org/belambert/cl-dct.svg?branch=main)](https://travis-ci.org/belambert/cl-dct)
[![Coverage Status](https://coveralls.io/repos/github/belambert/cl-dct/badge.svg?branch=main)](https://coveralls.io/github/belambert/cl-dct?branch=main)

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
