import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ArtifactComponent } from '../../components/artifacts/artifacts.component';

describe('ArtifactComponent', () => {
  let component: ArtifactComponent;
  let fixture: ComponentFixture<ArtifactComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ArtifactComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ArtifactComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
