import { TestBed } from '@angular/core/testing';

import { AboriginalSymbolsService } from './aboriginal-symbols.service';

describe('AboriginalSymbolsService', () => {
  let service: AboriginalSymbolsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AboriginalSymbolsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
