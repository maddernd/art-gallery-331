import { TestBed } from '@angular/core/testing';

import { ArtTypesService } from './art-types.service';

describe('ArtTypesService', () => {
  let service: ArtTypesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ArtTypesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
