function killpill --description='Kill services listening to specified PORTs'
  for PORT in $argv[1..]
    set --local PIDS (lsof -i :$PORT | awk 'NR>1 {print $2}')

    if test (count $PIDS) -eq 0
        continue
    else
      echo "Killing services listening on PORT: $PORT"

      for PID in PIDS
        echo "Killing process: $PID"
        kill $PID
      end
    end

  end
end
