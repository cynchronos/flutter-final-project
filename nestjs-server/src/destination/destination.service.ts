import { Model } from 'mongoose';
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Destination } from './schemas/destination.schema';

@Injectable()
export class DestinationService {
  constructor(
    @InjectModel(Destination.name) private destination: Model<Destination>,
  ) {}

  async findAll() {
    try {
      const data = await this.destination.find().exec();

      if (data.length < 1) {
        const error = new Error();
        error.message = 'Data tidak ditemukan';

        throw error;
      }

      return JSON.stringify({
        success: true,
        message: 'Data dimuat',
        data: data,
      });
    } catch (error) {
      return JSON.stringify({
        success: false,
        message: error.message || 'Data gagal dimuat',
      });
    }
  }
}
