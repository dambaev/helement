#ifndef HELEMENTARY_ELEMENTARYFFI_HSC_H
#define HELEMENTARY_ELEMENTARYFFI_HSC_H
#include <HsFFI.h>
#if __NHC__
#undef HsChar
#define HsChar int
#endif
#line 1 "ElementaryFFI.hsc"
#include <bindings.dsl.h>
#line 5 "ElementaryFFI.hsc"
#include "Elementary.h"
#line 30 "ElementaryFFI.hsc"
extern elm_object_text_set , Ptr <Evas_Object> -> Ptr CChar -> IO ();
#endif
