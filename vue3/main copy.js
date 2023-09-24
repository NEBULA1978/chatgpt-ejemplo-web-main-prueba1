const app = Vue.createApp({});

app.component('mi-componente', {
  template: `
    <div>
      <h1>Mi primer componente Vue</h1>
      <p>{{ mensaje }}</p>
      <button @click="cambiarMensaje">Cambiar Mensaje</button>
    </div>
  `,
  data() {
    return {
      mensaje: '¡Hola desde Vue!'
    };
  },
  methods: {
    cambiarMensaje() {
      if (this.mensaje === '¡Hola desde Vue!') {
        this.mensaje = 'Mensaje cambiado';
      } else {
        this.mensaje = '¡Hola desde Vue!';
      }
    }
  }
});

app.mount('#app');
