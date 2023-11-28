require('fidget').setup({
  text = {
    spinner = 'dots',
  },
  window = {
    blend = 0,
    relative = "editor"
  },
  fmt = {
    stack_upwards = true,
    task =
      function(task_name, message, percentage)
        return string.format(
          '%s%s [%s]',
          message,
          percentage and string.format(' (%s%%)', percentage) or '',
          task_name
        )
      end,
    }
})
