import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ArtFactComponent } from './art-fact.component';

describe('ArtFactsComponent', () => {
  let component: ArtFactComponent;
  let fixture: ComponentFixture<ArtFactComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ArtFactComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ArtFactComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
