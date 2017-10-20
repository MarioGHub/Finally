/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

            
            function validar() {
                var validado = true;
                elementos = document.getElementsByClassName("inputFormu");
                for (i = 0; i < elementos.length; i++) {
                    if (elementos[i].value === "" || elementos[i].value === null) {
                        validado = false;
                    }
                }
                if (validado) {
                    if (document.getElementById('usu').value.length === 10) {
                        document.getElementById("boton").disabled = false;
                    } else {
                        document.getElementById("boton").disabled = true;
                        //Salta un alert cada vez que escribes y hay un campo vacio
                        //alert("Dui incompleto")   
                    }

                } else {
                    document.getElementById("boton").disabled = true;
                    //Salta un alert cada vez que escribes y hay un campo vacio
                    //alert("Hay campos vacios")   
                }
            }
            
            function lim() {
                document.getElementById('res').value = "";
            }


