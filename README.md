# CV
My C.V., in [jsonresume](https://github.com/jsonresume/resume-schema) format.
Obeys the schema as last updated on
[April 27th, 2016](https://github.com/jsonresume/resume-schema/blob/81458745bf48981ea5f9beb124d2f1378ef56ff1/schema.json)
(except the `meta` field, which the `resume-cli` tool does not yet support).

At some point, I'll migrate away from my
[current resume](http://thekev.in/resource/cv.pdf) to this one -- I love the
idea of a CV-as-code, but the schema is still missing some features I'd like.

This repository continuously deploys several versions of my CV -- see
circle.yml for an up-to-date current listing. Of the many themes, I think
[this one](https://circleci.com/api/v1/project/TheKevJames/cv/latest/artifacts/0/$CIRCLE_ARTIFACTS/resume-elegant.html?branch=master&filter=successful)
is my favorite.

You can find that one manually (egads!) deployed to
[jsonresume.org/thekevjames](http://registry.jsonresume.org/thekevjames)
