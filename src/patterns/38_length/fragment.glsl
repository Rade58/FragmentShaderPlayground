// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


// copied from    https://thebookofshaders.com/10/
// this function is pseudo random
// not trully random since always will produce
// same result, for the desired coordinates
float random (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}


void main() {

  // length function
  // get length of vectors like vec2 vec3 vec4
  
  // what is length of vUv coordinates for example
  // length = √(x² + y²)

  // so basically it will be the distance from (0.0 , 0.0) to the
  // actual current vUv coordinate (vUv.x, Vuv.y)

  float distanceFromCenter = length(vUv);

  // which will create circular gradient with center in (0.0, 0.0)
  // and most black will be in that center

  float strength = distanceFromCenter;


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}