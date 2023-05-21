import { Injectable } from '@nestjs/common';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class AuthService {
  constructor(private usersService: UsersService) {}

  async signIn(username: string, password: string) {
    try {
      const user = await this.usersService.findOne(username);

      if (!user || user.password !== password) {
        const error = new Error();
        error.message = 'Username atau password salah';

        throw error;
      }

      return JSON.stringify({
        success: true,
        message: 'Login Sukses',
        data: {
          username: user.username,
          firstname: user.firstname,
          lastname: user.lastname,
          email: user.email,
          phone: user.phone,
        },
      });
    } catch (error) {
      return JSON.stringify({
        success: false,
        message: error.message || 'Login Gagal',
      });
    }
  }
}
