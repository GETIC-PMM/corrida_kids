
// aumentar fontes bootstrap
function aumentarFonte() {
    // get all fonts
    var elemento = document.getElementById("content");
    var fonte = window.getComputedStyle(elemento, null).getPropertyValue('font-size');
    var tamanho = parseFloat(fonte);
    // elemento.style.fontSize = (tamanho + 1) + 'px';
    document.body.style.fontSize= (tamanho + 1) + 'px';
}

// diminuir fonte
function diminuirFonte() {
    var elemento = document.getElementById("content");
    var fonte = window.getComputedStyle(elemento, null).getPropertyValue('font-size');
    var tamanho = parseFloat(fonte);
    // elemento.style.fontSize = (tamanho - 1) + 'px';
    document.body.style.fontSize= (tamanho - 1) + 'px';
}

// aumentar zoom da tela
function aumentarZoom() {
    var elemento = document.getElementById("content");
    var fonte = window.getComputedStyle(elemento, null).getPropertyValue('zoom');
    var tamanho = parseFloat(fonte);
    // elemento.style.zoom = (tamanho + 0.1);
    document.body.style.zoom= (tamanho + 0.1);
}

// diminuir zoom da tela
function diminuirZoom() {
    var elemento = document.getElementById("content");
    var fonte = window.getComputedStyle(elemento, null).getPropertyValue('zoom');
    var tamanho = parseFloat(fonte);
    // elemento.style.zoom = (tamanho - 0.1);
    document.body.style.zoom= (tamanho - 0.1);
}

