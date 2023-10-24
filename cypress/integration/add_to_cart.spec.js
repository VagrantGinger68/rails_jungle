describe('Add to cart', () => {

  it("should click add to cart button on first product", () => {
    cy.visit('/');

    cy.get('.navbar').should('contain', 'My Cart (0)');

    cy.get('.products article').first().find('button').click({force: true});

    cy.get('.navbar').should('contain', 'My Cart (1)');
  });
  
});