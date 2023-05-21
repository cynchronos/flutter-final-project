import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const host = '192.168.162.87';
  const app = await NestFactory.create(AppModule);
  await app.listen(3000, host || null);
  console.log(`Server Listened on http://${host}:3000`);
}
bootstrap();
