# Fragment Shaders Patterns Playground

```
pnpm add lil-gui three
```

```
pnpm add -D @types/three vite vite-plugin-glslify
```

Important that **we look at fragment shader as program that gpu calls every time he wants to paint pixel/s, and it is called after vertex shader**

# `uv` coordinates

**Every time gpu calls fragment shader program, that program paints the different pixel, which means different uv coordinate is available in every of the program calls**

- Available as `attribute`, and attributes are only available in vertex shader.
- So we send them to fragment shader as `varying`, since we don't have direct access to attributes inside fragment shader
- They contain x and y coordinates of the geometry you are using
- they go from 0.0 to 1.0 over x or y axis
- if you look at plane geometry, coordinate beginning will be in (0.0) and last coordinate is (1.0, 1.0)

The rest should be intuitive and math related

# Understanding `mod` function (modulo)

I want to better understand modulo. Especially to understand of how we use it to divide everything in segments and paint those segments the same way.

For example, this: `mod(x * 10.0, 1.0)` will produce 10 segments painted the same.

Ok, this is the example and you can **imagine that `x` is different anytime GPU calls the shader**, just **ignore that x is uniform here, imagine `vUv.x` instead** ;

```glsl

precision mediump float;

uniform float x;

void main() {

float strength = mod(x * 10.0, 1.0);

	gl_FragColor = vec4(vec3(strength), 1.0);

}

```

Here's a comprehensive test for the modulo function:

First test tests the number between 0.0 and 0.1, the next one between 0.1 and 0.2 and so on and so on.

| Test Range                | x Value | x \* 10.0 | Divisor (1.0) | Result (mod) |
| ------------------------- | ------- | --------- | ------------- | ------------ |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
| **0.0 - 0.1**             | 0.00    | 0.00      | 1.0           | 0.00         |
| 0.0 - 0.1                 | 0.01    | 0.10      | 1.0           | 0.10         |
| 0.0 - 0.1                 | 0.02    | 0.20      | 1.0           | 0.20         |
| 0.0 - 0.1                 | 0.03    | 0.30      | 1.0           | 0.30         |
| 0.0 - 0.1                 | 0.04    | 0.40      | 1.0           | 0.40         |
| 0.0 - 0.1                 | 0.05    | 0.50      | 1.0           | 0.50         |
| 0.0 - 0.1                 | 0.06    | 0.60      | 1.0           | 0.60         |
| 0.0 - 0.1                 | 0.07    | 0.70      | 1.0           | 0.70         |
| 0.0 - 0.1                 | 0.08    | 0.80      | 1.0           | 0.80         |
| 0.0 - 0.1                 | 0.10    | 1.00      | 1.0           | 0.00         |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
| **0.1 - 0.2**             | 1.01    | 10.10     | 1.0           | 0.10         |
| 0.1 - 0.2                 | 1.02    | 10.20     | 1.0           | 0.20         |
| 0.1 - 0.2                 | 1.03    | 10.30     | 1.0           | 0.30         |
| 0.1 - 0.2                 | 1.04    | 10.40     | 1.0           | 0.40         |
| 0.1 - 0.2                 | 1.05    | 10.50     | 1.0           | 0.50         |
| 0.1 - 0.2                 | 1.06    | 10.60     | 1.0           | 0.60         |
| 0.1 - 0.2                 | 1.07    | 10.70     | 1.0           | 0.70         |
| 0.1 - 0.2                 | 1.08    | 10.80     | 1.0           | 0.80         |
| 0.1 - 0.2                 | 1.09    | 10.90     | 1.0           | 0.90         |
| 0.1 - 0.2                 | 1.10    | 11.00     | 1.0           | 0.00         |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
| **0.2 - 0.3**             | 2.01    | 20.10     | 1.0           | 0.10         |
| 0.2 - 0.3                 | 2.02    | 20.20     | 1.0           | 0.20         |
| 0.2 - 0.3                 | 2.03    | 20.30     | 1.0           | 0.30         |
| 0.2 - 0.3                 | 2.04    | 20.40     | 1.0           | 0.40         |
| 0.2 - 0.3                 | 2.05    | 20.50     | 1.0           | 0.50         |
| 0.2 - 0.3                 | 2.06    | 20.60     | 1.0           | 0.60         |
| 0.2 - 0.3                 | 2.07    | 20.70     | 1.0           | 0.70         |
| 0.2 - 0.3                 | 2.08    | 20.80     | 1.0           | 0.80         |
| 0.2 - 0.3                 | 2.09    | 20.90     | 1.0           | 0.90         |
| 0.2 - 0.3                 | 2.10    | 21.00     | 1.0           | 0.00         |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
| **0.3 - 0.4**             | 3.01    | 30.10     | 1.0           | 0.10         |
| 0.3 - 0.4                 | 3.02    | 30.20     | 1.0           | 0.20         |
| ... (continued similarly) | ...     | ...       | ...           | ...          |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
|                           |         |           |               |              |
| **0.9 - 1.0**             | 9.01    | 90.10     | 1.0           | 0.10         |
| 0.9 - 1.0                 | 9.10    | 91.00     | 1.0           | 0.00         |

### Conclusion from the test

As you can see this modulo produced repeating sequences of numbers, and that is why this fragment shader would produce 10 segments painted the same way,

This is what this shader would paint on the render:

![modulo](/images/Screenshot%20from%202024-11-21%2001-41-20.png)
