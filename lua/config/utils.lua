local utils = {}

--- function utils.info
--- --
--- Muestra el log de un punto depurativo mostrando la linea y la columna.
--- --
--- @param str string
utils.info = function (str)
    local r,c = table.unpack(vim.api.nvim_win_get_cursor(0))
    print("debug point at line " .. tostring(r) .. " column " .. tostring(c) ":\n" .. str)
end

--- function utils.exec_secure
--- 
--- Evalua una expresion contenida en una funcion para prevenir errores que hagan
--- finalizar la ejecuccion.
--- --
--- @param func function
--- @param message string
--- @param args table
--- @return any result
--- --
--- Tras ejecutar la funcion func, si ha detectado algun error, mostrara el mensaje de error.
--- 
--- args son los argumentos que deben pasarse a func agrupados en una tabla (list).
--- -- 
utils.exec_secure = function (func,message,args)
    local ok,result = pcall(function ()
        func(table.unpack(args))
    end)
    if not ok then
        print("** Error ** : "..(message or ""))
    end
    return result
end

return utils
