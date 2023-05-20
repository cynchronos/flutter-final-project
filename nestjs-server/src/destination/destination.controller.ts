// import { Body, Controller, Post, HttpCode, HttpStatus, Get } from '@nestjs/common';
import { Controller, Get } from '@nestjs/common';
import { DestinationService } from './destination.service';

@Controller('destination')
export class DestinationController {
  constructor(private destinationService: DestinationService) {}

  @Get()
  async index() {
    return await this.destinationService.findAll();
  }
}
