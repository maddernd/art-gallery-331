import { Component, OnInit } from '@angular/core';
import { AboriginalSymbolService } from '../../services/aboriginal-symbols.service';
import { AboriginalSymbol } from '../../services/models/aboriginal_symbols';

@Component({
  selector: 'app-aboriginal-symbol',
  templateUrl: './aboriginal-symbol.component.html',
  styleUrls: ['./aboriginal-symbol.component.scss']
})
export class AboriginalSymbolComponent implements OnInit {
  aboriginalSymbols: AboriginalSymbol[] = [];
  selectedAboriginalSymbol: AboriginalSymbol | null = null;

  constructor(private aboriginalSymbolsService: AboriginalSymbolService) {}

  ngOnInit(): void {
    this.getAboriginalSymbols();
  }

  getAboriginalSymbols(): void {
    this.aboriginalSymbolsService.getAboriginalSymbols().subscribe((aboriginalSymbols) => (this.aboriginalSymbols = aboriginalSymbols));
  }

  selectAboriginalSymbol(aboriginalSymbol: AboriginalSymbol): void {
    this.selectedAboriginalSymbol = aboriginalSymbol;
  }

  createAboriginalSymbol(aboriginalSymbol: AboriginalSymbol): void {
    this.aboriginalSymbolsService.addAboriginalSymbol(aboriginalSymbol).subscribe((newAboriginalSymbol) => {
      this.aboriginalSymbols.push(newAboriginalSymbol);
      this.selectedAboriginalSymbol = null;
    });
  }

  updateAboriginalSymbol(aboriginalSymbol: AboriginalSymbol): void {
    this.aboriginalSymbolsService.updateAboriginalSymbol(aboriginalSymbol.id, aboriginalSymbol).subscribe(() => {
      this.getAboriginalSymbols();
      this.selectedAboriginalSymbol = null;
    });
  }

  deleteAboriginalSymbol(aboriginalSymbol: AboriginalSymbol): void {
    this.aboriginalSymbolsService.deleteAboriginalSymbol(aboriginalSymbol.id).subscribe(() => {
      this.aboriginalSymbols = this.aboriginalSymbols.filter((a) => a.id !== aboriginalSymbol.id);
      this.selectedAboriginalSymbol = null;
    });
  }
}
