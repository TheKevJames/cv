var fs = require('fs');
var Handlebars = require('handlebars');
var moment = require('moment');

function formatDate(date) {
    var format = 'MMM YYYY';
    return moment(date, "YYYY-MM-DD").format(format);
}

function formatDates(dates) {
    if (dates.date) {
        dates.date = formatDate(dates.date);
    }

    if (dates.startDate) {
        dates.startDate = formatDate(dates.startDate);
    }

    if (dates.endDate) {
        dates.endDate = formatDate(dates.endDate);
    }
}

function render(resume) {
    var css = fs.readFileSync(__dirname + '/style.css', 'utf-8');
    var tpl = fs.readFileSync(__dirname + '/resume.hbs', 'utf-8');

    var sectionsWithDates = ['work', 'volunteer', 'education', 'awards'];
    sectionsWithDates.forEach((section) => {
        if (!resume[section]) { return; }
        resume[section].map(formatDates);
    });

    return Handlebars.compile(tpl)({
        css: css,
        resume: resume
    });
}

var pdfRenderOptions = {
    format: 'A4',
    margin: {top: '10mm', right: '10mm', bottom: '10mm', left: '10mm'},
    printBackground: true,
    scale: 0.75
};

// resumed import()s the theme, so Node only exposes exports that its CJS
// lexer can detect statically; keep every value here a bare identifier.
module.exports = {
    pdfRenderOptions: pdfRenderOptions,
    render: render
};
