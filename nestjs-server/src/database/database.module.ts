import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';

ConfigModule.forRoot();

@Module({
  imports: [MongooseModule.forRoot(process.env.MONGODB_URI)],
})
export class DatabaseModule {}
