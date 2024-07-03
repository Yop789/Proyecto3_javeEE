
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" id="div1">
          <button
            type="button"
            class="navbar-toggle collapsed"
            data-toggle="collapse"
            data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false"
          >
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#" id="enlace1">Restaurante </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Cliente<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
                <li>
                  <a href="<%=request.getContextPath()%>/clientes/listar"
                    >Listar Cliente</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/clientes/alta"
                    >Alta Cliente</a
                  >
                </li>
              </ul>
            </li>

            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Mesas<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
                <li>
                  <a href="<%=request.getContextPath()%>/mesas/listar"
                    >Lista Mesas</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/mesas/alta"
                    >Alta Mesas</a
                  >
                </li>
              </ul>
            </li>

            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Reservaciones<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
              <li>
                  <a href="<%=request.getContextPath()%>/reservaciones/listar"
                    >Listado de reservaciones</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/reservaciones/alta"
                    >Alta de Reservaciones</a
                  >
                </li>
              </ul>
            </li>

            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Mesero<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
              <li>
                  <a href="<%=request.getContextPath()%>/meseros/listar"
                    >Listado de Meseros</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/meseros/alta"
                    >Alta de Mesero</a
                  >
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Platillos<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
              <li>
                  <a href="<%=request.getContextPath()%>/platillos/listar"
                    >Listado de platillos</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/platillos/alta"
                    >Alta de Platillo</a
                  >
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Ordenes<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
              <li>
                  <a href="<%=request.getContextPath()%>/ordenes/listar"
                    >Listado de Ordenes</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/ordenes/alta"
                    >Alta de orden</a
                  >
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a
                href="#"
                class="dropdown-toggle"
                data-toggle="dropdown"
                role="button"
                aria-haspopup="true"
                aria-expanded="false"
                >Detaller Ordenes<span class="caret"></span
              ></a>
              <ul class="dropdown-menu">
              <li>
                  <a href="<%=request.getContextPath()%>/descripciones/listar"
                    >Listado de Detallado de ordenes</a
                  >
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/descripciones/alta"
                    >Alta Descripcion de orden</a
                  >
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a
                href="<%=request.getContextPath()%>/cliente-reserva"
                class="dropdown-toggle"
                >Cliente Reservacion</a>
              
            </li>
          </ul>
        </div>

      </div>

    </nav>
 
