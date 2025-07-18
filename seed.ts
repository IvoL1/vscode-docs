import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  console.log('🌱 Iniciando seed...');

  // 1. Criar usuários primeiro
  await seedUsers();

  // 2. Criar times (que dependem dos usuários)
  await seedTeams();

  // 3. Criar tarefas (que dependem dos times/usuários)
  await seedTasks();

  console.log('✅ Seed finalizado com sucesso!');
}

// Executar seed
