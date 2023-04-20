import { TestBed } from '@angular/core/testing';

import { ArtFactsService } from './art-facts.service';

describe('ArtFactsService', () => {
  let service: ArtFactsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ArtFactsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
