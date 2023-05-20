import { Test, TestingModule } from '@nestjs/testing';
import { DestinationController } from './destination.controller';

describe('DestinationController', () => {
  let controller: DestinationController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DestinationController],
    }).compile();

    controller = module.get<DestinationController>(DestinationController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
