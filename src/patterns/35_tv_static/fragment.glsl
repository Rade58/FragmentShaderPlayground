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

  // we will just use upper random with outr uv vec2 
 
  float strength = random(vUv);


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}