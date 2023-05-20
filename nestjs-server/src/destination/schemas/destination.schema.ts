import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';

export type UserDocument = HydratedDocument<Destination>;

@Schema()
export class Destination {
  @Prop({ required: true, unique: true })
  name: string;

  @Prop({ required: true })
  location: string;

  @Prop()
  image: string;

  @Prop({ required: true })
  description: string;

  @Prop()
  photos: string[];

  @Prop()
  interest: string[];

  @Prop({ required: true })
  price: number;

  @Prop()
  rating: number;

  @Prop({ required: true })
  type: string;
}

export const DestinationSchema = SchemaFactory.createForClass(Destination);
