cl-dct
======

[Discrete cosine transform (DCT)](https://en.wikipedia.org/wiki/Discrete_cosine_transform) 
is a signal processing algorithm, that compresses a signal.  It's
similar to a Fourier transform. DCT is often used in speech recognition for
computing MFCC features.

There are a number of different versions and implementations of
DCT. This implementation mimics the one in Matlab. You should also get
the same results in scipy with the command:

```python
scipy.fftpack.dct([4., 3., 5., 10.], norm='ortho')
```

The `idct()` implementation is equivalent to the Matlab implementation
and the scipy command:

```python
scipy.fftpack.idct([4., 3., 5., 10.], norm='ortho')
```
