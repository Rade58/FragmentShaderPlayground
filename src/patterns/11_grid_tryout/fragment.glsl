precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // to create better looking grid I parametarized some things
  float grid_items_by_row_or_column = 2.0;
  
  vec2 center = vec2(0.5, 0.5);

  vec2 coords = vUv - center / grid_items_by_row_or_column / 2.0;

  float strengthX = mod(
    coords.x * grid_items_by_row_or_column,
    1.0
  );
  float strengthY = mod(
    coords.y * grid_items_by_row_or_column,
    1.0
  );

  float strength = step(0.5, strengthX) + step(0.5, strengthY);


  // strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);


}