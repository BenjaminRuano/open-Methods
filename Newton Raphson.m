clc; clear; close all;

% Método de Newton-Raphson para resolver f(x) = e^(-x) - x = 0
% Definir la función f(x) y su derivada f'(x)

f = @(x) exp(-x) - x;          % f(x) = e^(-x) - x
df = @(x) -exp(-x) - 1;        % Derivada de f(x), f'(x) = -e^(-x) - 1

% Parámetros iniciales
X0 = 0;                         % Valor inicial
tolerancia = 1e-6;              % Tolerancia para el criterio de parada

% Inicialización
X = X0;
iteracion = 0;
error = inf;                    % Iniciar error con un valor grande

% Crear un arreglo para almacenar los resultados de cada iteración
resultados = [];

% Método de Newton-Raphson
while error > tolerancia
    iteracion = iteracion + 1;           % Contar el número de iteraciones
    fxi = f(X);                          % Evaluar f(xi)
    dfxi = df(X);                        % Evaluar f'(xi)
    X_nueva = X - fxi / dfxi;            % Fórmula de Newton-Raphson
    error = abs(X_nueva - X);            % Calcular el error
    % Almacenar los resultados de esta iteración
    resultados = [resultados; iteracion, X, fxi, dfxi, X_nueva, error];
    X = X_nueva;                         % Actualizar el valor de X para la siguiente iteración
end

% Convertir los resultados en una tabla y mostrarla
tabla_resultados = array2table(resultados, 'VariableNames', {'Iteracion', 'Xi', 'f_Xi', 'f_prime_Xi', 'Xi_1', 'Error'});


% Mostrar la tabla
disp(tabla_resultados);

% Mostrar el resultado final
fprintf('\nLa solución final es x = %.6f\n', X);
