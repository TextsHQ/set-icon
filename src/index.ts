import * as childProcess from 'child_process'
import * as path from 'path'

async function spawn(command: string, ...args: readonly string[]) {
  const cp = childProcess.spawn(command, args)
  const outChunks: any[] = []
  const errChunks: any[] = []
  cp.stdout.on('data', chunk => {
    outChunks.push(chunk)
  })
  cp.stderr.on('data', chunk => {
    errChunks.push(chunk)
  })
  return new Promise<{ exitCode: number | null, stdout: string, stderr: string }>(resolve => {
    cp.on('exit', exitCode => {
      const stdout = Buffer.concat(outChunks).toString()
      const stderr = Buffer.concat(errChunks).toString()
      resolve({ exitCode, stdout, stderr })
    })
  })
}

export default async function setIcon(filePath: string, iconPath: string | null) {
  const args = iconPath ? [filePath, iconPath] : [filePath]
  const { exitCode } = await spawn(path.join(__dirname, 'set-icon'), ...args)
  if (exitCode !== 0) throw Error('setIcon forFile failed')
}
