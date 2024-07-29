import { Injectable /*, UnauthorizedException*/ } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { UserDto } from './dto/user.dto';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  async findUser(email: string): Promise<UserDto | undefined> {
    return await this.usersRepository.findOne({ where: { email } });
  }
}
