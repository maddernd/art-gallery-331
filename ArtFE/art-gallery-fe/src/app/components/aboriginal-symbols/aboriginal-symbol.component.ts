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
  currentPage: number = 1;
  pageSize: number = 10;
  
  constructor(private aboriginalSymbolsService: AboriginalSymbolService) {}

  ngOnInit(): void {
    this.getAboriginalSymbols();
  }

  getAboriginalSymbols(): void {
    this.aboriginalSymbolsService.getAboriginalSymbols().subscribe((aboriginalSymbols) => {
      this.aboriginalSymbols = aboriginalSymbols;
    });
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

  get pagedAboriginalSymbols(): AboriginalSymbol[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    return this.aboriginalSymbols.slice(startIndex, startIndex + this.pageSize);
  }

  get totalPages(): number {
    return Math.ceil(this.aboriginalSymbols.length / this.pageSize);
  }

  get pageNumbers(): number[] {
    const totalPages = this.totalPages;
    const pageNumbers = [];

    for (let i = 1; i <= totalPages; i++) {
      pageNumbers.push(i);
    }

    return pageNumbers;
  }

  setPage(pageNumber: number) {
    this.currentPage = pageNumber;
  }
  onPageChanged(event: any): void {
    this.currentPage = event.pageIndex + 1;
  }
}
