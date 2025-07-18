import winston from 'winston';

const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info', // Nível mínimo de log (info, warn, error, debug)
  format: winston.format.combine(
    winston.format.colorize(), // ATIVA CORES NO CONSOLE
    winston.format.timestamp({ format: 'HH:mm:ss' }), // Mostra hora
    winston.format.printf(({ level, message, timestamp }) => {
      return `[${timestamp}] ${level}: ${message}`;
    })
  ),
  transports: [
    new winston.transports.Console(), // Mostra no terminal
    new winston.transports.File({
      // Salva em arquivo
      filename: 'logs/error.log',
      level: 'error', // Só erros vão para esse arquivo
    }),
    new winston.transports.File({
      filename: 'logs/combined.log', // Todos os logs vão para esse arquivo
    }),
  ],
});

export default logger;
