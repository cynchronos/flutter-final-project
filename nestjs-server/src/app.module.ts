import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { DestinationModule } from './destination/destination.module';

ConfigModule.forRoot();

@Module({
  imports: [DatabaseModule, AuthModule, UsersModule, DestinationModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
