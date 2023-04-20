import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ArtFactsComponent } from './art-facts.component';

describe('ArtFactsComponent', () => {
  let component: ArtFactsComponent;
  let fixture: ComponentFixture<ArtFactsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ArtFactsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ArtFactsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
