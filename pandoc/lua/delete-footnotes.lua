-- Filtro para eliminar notas al pie y referencias a notas al pie
function Note (elem)
  -- Devuelve una lista vacía para eliminar el elemento Note
  return {}
end

function NoteRef (elem)
  -- Devuelve una lista vacía para eliminar el elemento NoteRef
  return {}
end

-- Devolver el filtro en un objeto que Pandoc pueda utilizar
return {
  {
    Note = Note,
    NoteRef = NoteRef
  }
}
