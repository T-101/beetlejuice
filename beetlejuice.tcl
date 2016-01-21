namespace eval ::beetlejuice:: {

setudef flag beetlejuice

set bjversion 1.0

bind pub -|- "beetlejuice" ::beetlejuice::handler

set bjCounter 0

proc handler { nick mask hand channel args } {

}

# http://www.rottentomatoes.com/m/beetlejuice/quotes/

putlog "Beetlejuice version $bjVersion by T-101/Primitive loaded!"
}
