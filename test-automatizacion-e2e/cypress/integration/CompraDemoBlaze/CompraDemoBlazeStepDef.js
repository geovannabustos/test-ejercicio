import {Given,And,When,Then} from "cypress-cucumber-preprocessor/steps";
Given(/^agrego dos productos al carrito$/, function () {
    cy.visit('https://www.demoblaze.com/');
    cy.get(':nth-child(1) > .card > :nth-child(1) > .card-img-top').click();
    cy.get('.col-sm-12 > .btn').click();
    cy.get('.active > .nav-link').click();
    cy.get(':nth-child(3) > .card > :nth-child(1) > .card-img-top').click();
    cy.get('.col-sm-12 > .btn').click();

});
And(/^visualizo los productos en el carrito$/, function () {
    cy.get(':nth-child(4) > .nav-link',{ timeout: 2000 }).click();
    cy.contains('Samsung galaxy s6').should('exist');
    cy.contains('Nexus 6').should('exist');
});
When(/^completo el formulario de compra$/, function () {
    cy.get('.col-lg-1 > .btn').click();
    cy.get('#name').type('Geovanna');
    cy.get('#country').type('Ecuador');
    cy.get('#city').type('Quito');
    cy.get('#card').type('12345');
    cy.get('#month').type('12');
    cy.get('#year').type('24');
});
And(/^finalizo la compra$/,function () {
    cy.get('#orderModal > .modal-dialog > .modal-content > .modal-footer > .btn-primary').click();
});
Then(/^se presentara el mensaje de confirmacion de la compra exitosa$/, function () {
    cy.contains('Thank you for your purchase!').should('exist');
    cy.contains('Id').should('exist');
    cy.contains('Amount').should('exist');
    cy.contains('Card Number: 12345').should('exist');
    cy.contains('Name: Geovanna').should('exist');
    cy.contains('Date').should('exist');
    cy.get('.confirm').click();
    cy.get('#orderModal > .modal-dialog > .modal-content > .modal-footer > .btn-secondary').click();

});