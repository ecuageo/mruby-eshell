
module EShell::Cd
  def self.included(klass)
    EShell.register("cd", CdCommand.new)
  end

  class CdCommand < ::EShell::CommandBase
    @@last = "/"
    def exec(*args)
      dir = args[0]
      dir = "/" if dir == nil
      dir = @@last if dir == "-"
      @@last = Dir.getwd
      Dir.chdir(dir)
    end

    def help(name)
      puts "cd <dir>"
    end
  end
end

