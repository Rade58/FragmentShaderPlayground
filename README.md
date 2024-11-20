# Fragment Shaders Playground

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
